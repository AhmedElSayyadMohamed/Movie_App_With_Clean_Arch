import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/trailer_movie.dart';
import '../../../../core/constance/request_enum.dart';
import '../../../domain/entity/movie_details.dart';

class MovieDetailsStates extends Equatable {
  final MovieDetails? movieDetailsModel;
  final RequestState movieDetailState;
  final String movieDetailsErrorMessage;
  final List<Movie> recommendationsMovies;
  final RequestState recommendationsMoviesState;
  final String recommendationsMoviesErrorMessage;
  final TrailerMovie trailerMovie;
  final RequestState trailerMovieState;
  final String trailerMovieErrorMessage;

  const MovieDetailsStates({
    this.recommendationsMovies =const[],
    this.recommendationsMoviesState = RequestState.loading,
    this.recommendationsMoviesErrorMessage = '',
    this.trailerMovie = const TrailerMovie(id: '', key: ''),
    this.trailerMovieState = RequestState.loading,
    this.trailerMovieErrorMessage = '',
    this.movieDetailsModel,
    this.movieDetailState = RequestState.loading,
    this.movieDetailsErrorMessage = '',
  });

  MovieDetailsStates copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailState,
    String? errorMessage,
    List<Movie>? recommendationsMovies,
    RequestState? recommendationsMoviesState,
    String? recommendationsMoviesErrorMessage,
    TrailerMovie? trailerMovie,
    RequestState? trailerMovieState,
    String? trailerMovieErrorMessage,
  }) =>
      MovieDetailsStates(
        movieDetailsModel: movieDetails ?? movieDetailsModel,
        movieDetailState: movieDetailState ?? this.movieDetailState,
        movieDetailsErrorMessage: errorMessage ?? movieDetailsErrorMessage,
        recommendationsMovies: recommendationsMovies ??
            this.recommendationsMovies,
        recommendationsMoviesState: recommendationsMoviesState ??
            this.recommendationsMoviesState,
        recommendationsMoviesErrorMessage: recommendationsMoviesErrorMessage ??
            this.recommendationsMoviesErrorMessage,
        trailerMovie: trailerMovie ?? this.trailerMovie,
        trailerMovieState: trailerMovieState ?? this.trailerMovieState,
        trailerMovieErrorMessage: trailerMovieErrorMessage ??
            this.trailerMovieErrorMessage,
      );

  @override
  List<Object?> get props =>
      [
        movieDetailsModel,
        movieDetailState,
        movieDetailsErrorMessage,
        recommendationsMovies,
        recommendationsMoviesState,
        recommendationsMoviesErrorMessage,
        trailerMovie,
        trailerMovieState,
        trailerMovieErrorMessage,
      ];
}
