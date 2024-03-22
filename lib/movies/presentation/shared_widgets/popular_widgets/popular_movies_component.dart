import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/events/movies_events.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/movie_details/movie_details.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../controller/movie_bloc/states/movie_states.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../../../core/constance/request_enum.dart';
import '../../../../core/utiles/share_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../error_message_widget.dart';
import 'movie_widget.dart';

class PopularMoviesComponent extends StatefulWidget {
  const PopularMoviesComponent({super.key});

  @override
  State<PopularMoviesComponent> createState() => _PopularMoviesComponentState();
}

class _PopularMoviesComponentState extends State<PopularMoviesComponent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      sl<MoviesBloc>().add(GetPopularMoviesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('PopularMoviesComponent build');
    }
    return BlocBuilder<MoviesBloc, MoviesStates>(
        buildWhen: (previous, current) => ((previous.popularMovieState != current.popularMovieState) ||
                (previous.popularPaginationState != current.popularPaginationState)),
        builder: (context, state) {
          if (kDebugMode) {
            print('PopularMoviesComponent BlocBuilder');
          }
          switch (state.popularMovieState) {
            case RequestState.loading:
              return const LoadingCircleIndicator();
            case RequestState.success:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsetsDirectional.only(
                      start: 16,
                    ),
                    itemBuilder: (context, index) {
                      if (index < state.popularMovies.length) {
                        return MovieWidget(
                          movie: state.popularMovies[index],
                          onTap:()=> onTapMovieCard(context,state.popularMovies[index]),
                          index: index,
                        );
                      } else if (state.popularMovies.isNotEmpty) {
                        return const LoadingCircleIndicator();
                      }
                    },
                    itemCount: state.popularMovies.length + 1,
                  ),
                ),
              );
            case RequestState.error:
              return ErrorMessageWidget(
                message: state.popularErrorMessage,
              );
          }
        },
    );
  }

  onTapMovieCard(context,movie){
    navigatePushTo(
      MovieDetailsScreen(
        movie:movie,
      ),
      context,
    );

  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }
}
