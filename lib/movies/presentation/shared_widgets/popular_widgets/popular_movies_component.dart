import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/events/movies_events.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/movie_details/movie_details.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../core/utiles/share_functions.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/states/movie_states.dart';
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
    print('PopularMoviesComponent build');
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
        ((previous.popularMovieState!= current.popularMovieState)||
            ( previous.paginationState != current.paginationState)),

      builder: (context, state) {
        print('PopularMoviesComponent BlocBuilder');
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 250,
            child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsetsDirectional.only(
                start: 16,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                 if(index< state.popularMovies.length){
                return MovieWidget(
                  image: state.popularMovies[index].posterPath!,
                  title: state.popularMovies[index].title,
                  date: state.popularMovies[index].releaseDate,
                  voteAverage: state.popularMovies[index].voteAverage,
                  onTap: () {
                    navigatePushTo(
                      MovieDetailsScreen(
                        movie: state.popularMovies[index],
                      ),
                      context,
                    );
                  },
                );}
                 else{

                     return const LoadingCircleIndicator();

                 }
              },
              itemCount: state.popularMovies.length+1,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }
}
