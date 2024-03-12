import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/get_now_playing_movies.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/events/movies_events.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/states/movie_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovies _getNowPlayingMovies ;
  MoviesBloc(this._getNowPlayingMovies) : super(const MoviesStates()) {

    on<GetPlayingNowMoviesEvent>((event, emit) async {
      emit(const MoviesStates(playingNowMovieState: RequestState.loading));
      var result = await _getNowPlayingMovies.execute();
      result.fold(
          (l) => emit(MoviesStates(
              playingNowMovieState: RequestState.error,
              playingNowErrorMessage: l.errorMessage,
          )),
          (movies) => emit(MoviesStates(nowPlayingMovies:movies,playingNowMovieState: RequestState.success)));
    });

    // on<GetPlayingNowMoviesEvent>((event, emit) async {
    //   emit(const MoviesStates(playingNowMovieState: RequestState.loading));
    //   var result = await _getNowPlayingMovies.execute();
    //   result.fold(
    //           (l) => emit(MoviesStates(
    //         playingNowMovieState: RequestState.error,
    //         playingNowErrorMessage: l.errorMessage,
    //       )),
    //           (movies) => emit(MoviesStates(nowPlayingMovies:movies,playingNowMovieState: RequestState.success)));
    // });

  }
}
