import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/get_now_playing_movies.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/get_popular_movies.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/get_top_rated_movies.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/events/movies_events.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/states/movie_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;

  MoviesBloc(
    this._getNowPlayingMovies,
    this._getPopularMovies,
    this._getTopRatedMovies,
  ) : super(const MoviesStates()) {
    on<GetPlayingNowMoviesEvent>(_getPlayingNowMoviesFun);
    on<GetPopularMoviesEvent>(_getPopularMoviesFun);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesFun);
  }

  FutureOr<void> _getPlayingNowMoviesFun(
      GetPlayingNowMoviesEvent event, Emitter<MoviesStates> emit) async {
    var result = await _getNowPlayingMovies();
    result.fold(
      (l) => emit(state.copyWith(
        playingNowMovieState: RequestState.error,
        playingNowErrorMessage: l.errorMessage,
      )),
      (movies) => emit(
        state.copyWith(
          nowPlayingMovies: movies,
          playingNowMovieState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMoviesFun(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    var result = await _getPopularMovies();
    result.fold(
      (l) => emit(state.copyWith(
        popularMovieState: RequestState.error,
        popularErrorMessage: l.errorMessage,
      )),
      (movies) => emit(
        state.copyWith(
          popularMovies: movies,
          popularMovieState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMoviesFun(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    var result = await _getTopRatedMovies();
    result.fold(
      (l) => emit(state.copyWith(
        topRatedMovieState: RequestState.error,
        topRatedErrorMessage: l.errorMessage,
      )),
      (movies) => emit(
        state.copyWith(
          topRatedMovies: movies,
          topRatedMovieState: RequestState.success,
        ),
      ),
    );
  }
}
