import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/core/services_locator/services_locator.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/events/movies_events.dart';
import '../../../../core/utiles/share_functions.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/states/movie_states.dart';
import '../../screens/movie_details/movie_details.dart';
import '../error_message_widget.dart';
import '../loading_circle_indicator_widget.dart';
import '../popular_widgets/movie_widget.dart';

class TopRatedMoviesComponent extends StatefulWidget {
  const TopRatedMoviesComponent({super.key});

  @override
  State<TopRatedMoviesComponent> createState() =>
      _TopRatedMoviesComponentState();
}

class _TopRatedMoviesComponentState extends State<TopRatedMoviesComponent> {

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      sl<MoviesBloc>().add(GetTopRatedMoviesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('PopularMoviesComponent build');
    }

    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
      (previous.topRatedMovieState != current.topRatedMovieState)||
          ( previous.topPaginationState != current.topPaginationState),
      builder: (BuildContext context, state) {
        if (kDebugMode) {
          print('PopularMoviesComponent BlocBuilder');
        }

          switch (state.topRatedMovieState) {
            case RequestState.loading:
              return const LoadingCircleIndicator();
            case RequestState.success:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsetsDirectional.only(start: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index < state.topRatedMovies.length) {
                        return MovieWidget(
                          movie: state.topRatedMovies[index],
                          onTap: () {
                            navigatePushTo(
                              MovieDetailsScreen(
                                movie: state.topRatedMovies[index],
                              ),
                              context,
                            );
                          }, index: index,
                        );
                      } else {
                        return const LoadingCircleIndicator();
                      }
                    },
                    itemCount: state.topRatedMovies.length + 1,
                  ),
                ),
              );
            case RequestState.error:
              return ErrorMessageWidget(
                message: state.topRatedErrorMessage,
              );
          }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }
}
