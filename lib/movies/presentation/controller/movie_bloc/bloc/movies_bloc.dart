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


class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;
  List<Movie> popMovies = [];
  List<Movie> topMovies = [];
  List<Movie> nowPlayingMovies = [];

  //////////////////////////////////////////////

  static MoviesBloc get(context) => BlocProvider.of(context);

  MoviesBloc(
    this._getNowPlayingMovies,
    this._getPopularMovies,
    this._getTopRatedMovies,
  ) : super(MoviesStates()) {
    on<GetPlayingNowMoviesEvent>(_getPlayingNowMoviesFun);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesFun);
    on<GetPopularMoviesEvent>(_getPopularMoviesFun);
    on<RefreshHomeScreenEvent>(_refresh);
  }

  /////////////////////////////////////

  FutureOr<void> _getPlayingNowMoviesFun(
    GetPlayingNowMoviesEvent event,
    Emitter<MoviesStates> emit,
  ) async {
    state.nowPlayingMoviePageNum++;
    emit(state.copyWith(playingNowPaginationState: RequestState.loading));
    // get data
    var result = await _getNowPlayingMovies(
      numOfPage: Parameters(
        page: state.nowPlayingMoviePageNum,
      ),
    );
    emit(state.copyWith(playingNowPaginationState: RequestState.success));
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
          nowPlayingMovies: nowPlayingMovies.toSet().toList(),
          playingNowMovieState: RequestState.success,
        ),
      );
    },
    );
  }

  ///////////////////////////////////////////////
  FutureOr<void> _getPopularMoviesFun(
    GetPopularMoviesEvent event,
    Emitter<MoviesStates> emit,
  ) async {
    state.popularMoviePageNum++;
    emit(
      state.copyWith(
        popularPaginationState: RequestState.loading,
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
        popularPaginationState: RequestState.success,
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
            popularMovies: popMovies.toSet().toList(),
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
        topPaginationState: RequestState.loading,
      ),
    );

    var result = await _getTopRatedMovies(
      numOfPage: Parameters(
        page: event.page,
      ),
    );
    emit(
      state.copyWith(
        topPaginationState: RequestState.success,
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
            topRatedMovies: topMovies.toSet().toList(),
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
