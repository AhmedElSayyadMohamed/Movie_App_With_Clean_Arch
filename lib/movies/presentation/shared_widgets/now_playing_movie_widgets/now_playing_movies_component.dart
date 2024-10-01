import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/movie_details/movie_details.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/error_message_widget.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import '../../../../core/utiles/share_functions.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/states/movie_states.dart';
import 'now_playing_movie_component.dart';

class NowPlayingMoviesComponent extends StatelessWidget {
  const NowPlayingMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current)=>
      (previous.playingNowMovieState != current.playingNowMovieState)||
          (previous.playingNowPaginationState != current.playingNowPaginationState),
      builder: (BuildContext context, MoviesStates state) {

          switch (state.playingNowMovieState) {
            case RequestState.loading:
              return const LoadingCircleIndicator(height: 325,);
            case RequestState.success:
              return FadeIn(
                duration: const Duration(
                  milliseconds: 400,
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 325,
                    autoPlay: false,
                  ),
                  items: state.nowPlayingMovies
                      .map(
                        (movie) => NowPlayingMovieComponent(
                          movie: movie,
                          onTap: () {
                            navigatePushTo(
                                MovieDetailsScreen(movie: movie), context);
                          },
                        ),
                      )
                      .toList(),
                ),
              );
            case RequestState.error:
              return ErrorMessageWidget(
                message: state.playingNowErrorMessage,
              );
          }
      },
    );
  }
}
