import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';


class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState playingNowMovieState;
  final String playingNowErrorMessage;

  const MoviesStates({
    this.nowPlayingMovies = const[],
    this.playingNowMovieState = RequestState.loading,
    this.playingNowErrorMessage = '',
  });

  @override
  List<Object> get props =>
      [nowPlayingMovies, playingNowMovieState, playingNowErrorMessage,];
}
