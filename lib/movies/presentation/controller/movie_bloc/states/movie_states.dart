import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState playingNowMovieState;
  final RequestState playingNowPaginationState;
  final String playingNowErrorMessage;
  int nowPlayingMoviePageNum;

  ////////////////

  final List<Movie> popularMovies;
  final RequestState popularMovieState;
  final RequestState popularPaginationState;
  final String popularErrorMessage;
  int popularMoviePageNum;

  ///////////////////////

  final RequestState topPaginationState;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMovieState;
  final String topRatedErrorMessage;
  int topMoviePageNum;

  ////////////////////


    MoviesStates({
    this.popularMovies = const [],
    this.popularMovieState = RequestState.loading,
    this.topPaginationState = RequestState.loading,
    this.popularPaginationState = RequestState.loading,
    this.playingNowPaginationState = RequestState.loading,
    this.popularErrorMessage = '',
    this.popularMoviePageNum = 0,
    this.topMoviePageNum = 0,
    this.nowPlayingMoviePageNum = 0,
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
    RequestState? topPaginationState,
    RequestState? popularPaginationState,
    RequestState? playingNowPaginationState,
    String? popularErrorMessage,
    int? popularMoviePageNum,
    int? nowPlayingMoviePageNum,
    int? topMoviePageNum,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMovieState,
    RequestState? favouriteMovieState,
    int? toggleBottomNavBarItem,
    String? topRatedErrorMessage,
    List<Movie>? favouriteMovies,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      playingNowMovieState: playingNowMovieState ?? this.playingNowMovieState,
      playingNowErrorMessage:
          playingNowErrorMessage ?? this.playingNowErrorMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMovieState: popularMovieState ?? this.popularMovieState,
      topPaginationState: topPaginationState ?? this.topPaginationState,
      popularPaginationState:
          popularPaginationState ?? this.popularPaginationState,
      playingNowPaginationState:
          playingNowPaginationState ?? this.playingNowPaginationState,
      popularErrorMessage: popularErrorMessage ?? this.playingNowErrorMessage,
      nowPlayingMoviePageNum:
          nowPlayingMoviePageNum ?? this.nowPlayingMoviePageNum,
      topMoviePageNum: topMoviePageNum ?? this.topMoviePageNum,
      popularMoviePageNum: popularMoviePageNum ?? this.popularMoviePageNum,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMovieState: topRatedMovieState ?? this.topRatedMovieState,
      topRatedErrorMessage: topRatedErrorMessage ?? this.topRatedErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        playingNowMovieState,
        playingNowPaginationState,
        playingNowErrorMessage,
        popularMovies,
        popularMovieState,
        popularPaginationState,
        popularErrorMessage,
        topPaginationState,
        topRatedMovies,
        topRatedMovieState,
        topRatedErrorMessage,
      ];
}
