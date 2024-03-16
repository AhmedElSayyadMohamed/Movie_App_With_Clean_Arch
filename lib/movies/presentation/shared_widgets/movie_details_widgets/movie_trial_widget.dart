import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/constance/api_constance.dart';
import '../../../../core/constance/request_enum.dart';
import '../../../domain/entity/movie.dart';
import '../error_message_widget.dart';

class MovieTrialWidget extends StatelessWidget {
  final Movie movie;

  late YoutubePlayerController controller;
  MovieTrialWidget({super.key, required this.movie});

  void getMovieTrial({required String movieKey}) {
    controller = YoutubePlayerController(
      initialVideoId: movieKey,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      builder: (BuildContext context, state) {

        switch(state.trailerMovieState){
          case RequestState.loading: return const LoadingCircleIndicator();
          case RequestState.success:
            {
              getMovieTrial(movieKey:state.trailerMovie.key);
              return Container(
                height: 200,
                color: Colors.deepPurple,
                child:  YoutubePlayer(
                  controller:controller,
                  thumbnail:Image.network(ApiConstance.imageUrl(movie.backdropPath!),fit: BoxFit.cover,) ,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.deepPurpleAccent,
                    handleColor: Colors.deepPurpleAccent,
                  ),
                ),
              );
            }
          case RequestState.error: return  ErrorMessageWidget(message: state.trailerMovieErrorMessage);
        }

      },
    );
  }
}
