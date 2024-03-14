import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_event.dart';
import '../../../domain/use_cases/movie_details_use_cases/get_movie_details.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsStates> {
  final GetMovieDetails _getMovieDetailsUseCas;
  MovieDetailsBloc(this._getMovieDetailsUseCas)
      : super(const MovieDetailsStates()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsFun);
  }

  FutureOr<void> _getMovieDetailsFun(
      GetMovieDetailsEvent event, Emitter<MovieDetailsStates> emit) async {
    var result = await _getMovieDetailsUseCas(movieId: event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailState: RequestState.error,
          errorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailState: RequestState.success,
        ),
      ),
    );
  }
}
