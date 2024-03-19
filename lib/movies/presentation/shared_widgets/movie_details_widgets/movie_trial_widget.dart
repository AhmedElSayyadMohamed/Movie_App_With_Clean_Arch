import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../core/constance/request_enum.dart';
import '../../../domain/entity/movie.dart';
import '../error_message_widget.dart';

class MovieTrialWidget extends StatefulWidget {
  final Movie movie;
  const MovieTrialWidget({super.key, required this.movie});
  @override
  State<MovieTrialWidget> createState() => _MovieTrialWidgetState();
}

class _MovieTrialWidgetState extends State<MovieTrialWidget> {
  late YoutubePlayerController _controller;
  void getMovieTrial({required String movieKey}) {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: movieKey,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  void initState() {
    super.initState();
    getMovieTrial(movieKey: 'A002-b7IH2M');
  }

  @override
  Widget build(BuildContext context) {
    print('MovieTrialWidget build');
    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      builder: (BuildContext context, state) {
        print('MovieTrialWidget BlocBuilder');

        switch (state.trailerMovieState) {
          case RequestState.loading:
            return const LoadingCircleIndicator();
          case RequestState.success:
            {
              if (state.trailersMovie.isNotEmpty) {
                getMovieTrial(movieKey: state.trailersMovie[0].key);
              }
              return YoutubePlayerScaffold(
                controller: _controller,
                aspectRatio: 16 / 9,
                builder: (context,player)=> SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: YoutubePlayer(
                    controller: _controller,
                  ),
                ),
              );
            }
          case RequestState.error:
            return ErrorMessageWidget(message: state.trailerMovieErrorMessage);
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
