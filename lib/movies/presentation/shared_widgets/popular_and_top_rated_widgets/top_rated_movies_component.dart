import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/popular_and_top_rated_widgets/movie_widget.dart';

import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/states/movie_states.dart';

class TopRatedMoviesComponent extends StatelessWidget {
  const TopRatedMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current)=>previous.topRatedMovieState!=current.topRatedMovieState,
      builder: (BuildContext context, state) {
        switch(state.topRatedMovieState){
          case RequestState.loading: return const SizedBox(
            height: 170,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
          case RequestState.success: return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 240,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsetsDirectional.only(start: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MovieWidget(
                  image:state.topRatedMovies[index].posterPath,
                  title: state.topRatedMovies[index].title,
                  date: state.topRatedMovies[index].releaseDate,
                  voteAverage:  state.topRatedMovies[index].voteAverage,
                ),
                itemCount: state.topRatedMovies.length,
              ),
            ),
          );
          case RequestState.error: return  SizedBox(
            height: 360,
            child: Center(
              child: Text(state.topRatedErrorMessage),
            ),
          );
        }

      },
    );
  }
}
