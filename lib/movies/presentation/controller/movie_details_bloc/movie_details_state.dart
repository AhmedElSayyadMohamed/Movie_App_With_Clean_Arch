import 'package:equatable/equatable.dart';
import '../../../../core/constance/request_enum.dart';
import '../../../domain/entity/movie_details.dart';

class MovieDetailsStates extends Equatable {
  final MovieDetails? movieDetailsModel;
  final RequestState movieDetailState;
  final String errorMessage;

  const MovieDetailsStates({
    this.movieDetailsModel,
    this.movieDetailState = RequestState.loading,
    this.errorMessage = '',
  });

  MovieDetailsStates copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailState,
    String? errorMessage,
  }) =>
      MovieDetailsStates(
        movieDetailsModel: movieDetailsModel ?? this.movieDetailsModel,
        movieDetailState: movieDetailState ?? this.movieDetailState,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        movieDetailsModel,
        movieDetailState,
        errorMessage,
      ];
}
