import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_details_use_cases/get_movie_details.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/get_now_playing_movies.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/get_popular_movies.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/get_top_rated_movies.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/events/movies_events.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/states/movie_states.dart';

import '../../../../../core/services_locator/services_locator.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {

  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;
  List<Movie> popMovies = [];
  List<Movie> topMovies = [];
  List<Movie> nowPlayingMovies = [];

  //////////////////////////////////////////////

  MoviesBloc(
    this._getNowPlayingMovies,
    this._getPopularMovies,
    this._getTopRatedMovies,
  ) : super(MoviesStates()) {
    on<GetPlayingNowMoviesEvent>(_getPlayingNowMoviesFun);
    on<GetPopularMoviesEvent>(_getPopularMoviesFun);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesFun);
    on<RefreshHomeScreenEvent>(_refresh);
  }

  /////////////////////////////////////

  FutureOr<void> _getPlayingNowMoviesFun(
    GetPlayingNowMoviesEvent event,
    Emitter<MoviesStates> emit,
  ) async {
    state.nowPlayingMoviePageNum++;
    emit(state.copyWith(paginationState: RequestState.loading));
    // get data
    var result = await _getNowPlayingMovies(
        numOfPage: Parameters(page: state.nowPlayingMoviePageNum));
    result.fold((left) {
      emit(
        state.copyWith(
          playingNowMovieState: RequestState.error,
          playingNowErrorMessage: left.errorMessage,
        ),
      );
    }, (movies) {

      nowPlayingMovies.addAll(movies);
      emit(
        state.copyWith(
          nowPlayingMovies: movies,
          playingNowMovieState: RequestState.success,
        ),
      );
    });
  }

  ///////////////////////////////////////////////
  FutureOr<void> _getPopularMoviesFun(
    GetPopularMoviesEvent event,
    Emitter<MoviesStates> emit,
  ) async {
    state.popularMoviePageNum++;
    // print('popular${state.popularMoviePageNum}');
    // print(state.popularMovies.length);
    // print(state);

    emit(
      state.copyWith(
        paginationState: RequestState.loading,
      ),
    );
    // get data
    var result = await _getPopularMovies(
      numOfPage: Parameters(
        page: state.popularMoviePageNum,
      ),
    );
    emit(
      state.copyWith(
        paginationState: RequestState.success,
      ),
    );

    // handle data
    result.fold(
      (left) {
        emit(
          state.copyWith(
            popularMovieState: RequestState.error,
            popularErrorMessage: left.errorMessage,
          ),
        );
      },
      (right) {
        popMovies.addAll(right);
        emit(
          state.copyWith(
            popularMovies: popMovies,
            popularMovieState: RequestState.success,
          ),
        );
      },
    );
  }

  ////////////////////////////////////////////
  FutureOr<void> _getTopRatedMoviesFun(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesStates> emit,
  ) async {
    state.topMoviePageNum++;
    emit(
      state.copyWith(
        paginationState: RequestState.loading,
      ),
    );
    var result = await _getTopRatedMovies(
      numOfPage: Parameters(
        page: state.topMoviePageNum,
      ),
    );
    result.fold(
      (left) {
        emit(
          state.copyWith(
            topRatedMovieState: RequestState.error,
            topRatedErrorMessage: left.errorMessage,
          ),
        );
      },
      (right) {
        topMovies.addAll(right);
        emit(
          state.copyWith(
            topRatedMovies: topMovies,
            topRatedMovieState: RequestState.success,
          ),
        );
      },
    );
  }


  /////////////////////////////////////////////
  FutureOr<void> _refresh(
    RefreshHomeScreenEvent event,
    Emitter<MoviesStates> emit,
  ) {
      add(GetPlayingNowMoviesEvent());
      add(GetPopularMoviesEvent());
      add(GetTopRatedMoviesEvent());
      popMovies.shuffle();
      topMovies.shuffle();
      nowPlayingMovies.shuffle();
  }
}
