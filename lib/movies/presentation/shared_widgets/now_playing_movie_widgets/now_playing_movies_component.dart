import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/states/movie_states.dart';
import 'now_playing_movie_component.dart';

class NowPlayingMoviesComponent extends StatelessWidget {
  const NowPlayingMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc,MoviesStates>(
      buildWhen: (previous, current)=>previous.playingNowMovieState!=current.playingNowMovieState,
      builder: (BuildContext context, MoviesStates state) {
        print('BlocBuilder NowPlayingMoviesComponent ');
        switch(state.playingNowMovieState){
          case RequestState.loading: return const SizedBox(
            height: 360,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
          case RequestState.success: return FadeIn(
          duration: const Duration(
            milliseconds: 400,
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              height: 360,
            ),
            items: state.nowPlayingMovies
                .map(
                  (movie) => NowPlayingMovieComponent(
                image: movie.backdropPath,
                movieName: movie.title,
              ),
            )
                .toList(),
          ),
        );
          case RequestState.error: return  SizedBox(
            height: 360,
            child: Center(
              child: Text(state.playingNowErrorMessage),
            ),
          );
         }
      },
    );
  }
}