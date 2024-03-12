import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState playingNowMovieState;
  final String playingNowErrorMessage;
  final List<Movie> popularMovies;
  final RequestState popularMovieState;
  final String popularErrorMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMovieState;
  final String topRatedErrorMessage;

  const MoviesStates({
    this.popularMovies = const [],
    this.popularMovieState = RequestState.loading,
    this.popularErrorMessage = '',
    this.nowPlayingMovies = const [],
    this.playingNowMovieState = RequestState.loading,
    this.playingNowErrorMessage = '',
    this.topRatedMovies = const [],
    this.topRatedMovieState = RequestState.loading,
    this.topRatedErrorMessage = '',
  });

  MoviesStates copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? playingNowMovieState,
    String? playingNowErrorMessage,
    List<Movie>? popularMovies,
    RequestState? popularMovieState,
    String? popularErrorMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMovieState,
    String? topRatedErrorMessage,
  }) =>
      MoviesStates(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        playingNowMovieState: playingNowMovieState ?? this.playingNowMovieState,
        playingNowErrorMessage:
            playingNowErrorMessage ?? this.playingNowErrorMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularMovieState: popularMovieState ?? this.popularMovieState,
        popularErrorMessage: popularErrorMessage ?? this.playingNowErrorMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedMovieState: topRatedMovieState ?? this.topRatedMovieState,
        topRatedErrorMessage: topRatedErrorMessage ?? this.topRatedErrorMessage,
      );

  @override
  List<Object> get props => [
        nowPlayingMovies,
        playingNowMovieState,
        playingNowErrorMessage,
        popularMovies,
        popularMovieState,
        popularErrorMessage,
        topRatedMovies,
        topRatedMovieState,
        topRatedErrorMessage,
      ];
}
