import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/trailer_movie.dart';
import '../../../../core/constance/request_enum.dart';
import '../../../domain/entity/actor.dart';

class MovieDetailsStates extends Equatable {
  final Movie? movieDetailsModel;
  final RequestState movieDetailState;
  final String movieDetailsErrorMessage;
  final List<Movie> recommendationsMovies;
  final RequestState recommendationsMoviesState;
  final String recommendationsMoviesErrorMessage;
  final List<TrailerMovie> trailersMovie;
  final RequestState trailerMovieState;
  final String trailerMovieErrorMessage;
  final List<Actor> castActors;
  final RequestState castActorsState;
  final String castActorsErrorMessage;

  const MovieDetailsStates({
    this.castActors = const [],
    this.castActorsState = RequestState.loading,
    this.castActorsErrorMessage = '',
    this.recommendationsMovies = const[],
    this.recommendationsMoviesState = RequestState.loading,
    this.recommendationsMoviesErrorMessage = '',
    this.trailersMovie = const[],
    this.trailerMovieState = RequestState.loading,
    this.trailerMovieErrorMessage = '',
    this.movieDetailsModel,
    this.movieDetailState = RequestState.loading,
    this.movieDetailsErrorMessage = '',
  });

  MovieDetailsStates copyWith({
    Movie? movieDetails,
    RequestState? movieDetailState,
    String? errorMessage,
    List<Movie>? recommendationsMovies,
    RequestState? recommendationsMoviesState,
    String? recommendationsMoviesErrorMessage,
    List<TrailerMovie>? trailersMovie,
    RequestState? trailerMovieState,
    String? trailerMovieErrorMessage,
    List<Actor>? castActors,
    RequestState? castActorsState,
    String? castActorsErrorMessage,
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
        trailersMovie: trailersMovie ?? this.trailersMovie,
        trailerMovieState: trailerMovieState ?? this.trailerMovieState,
        trailerMovieErrorMessage: trailerMovieErrorMessage ??
            this.trailerMovieErrorMessage,
        castActors: castActors ?? this.castActors,
        castActorsState: castActorsState ?? this.castActorsState,
        castActorsErrorMessage: castActorsErrorMessage ??
            this.castActorsErrorMessage,
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
        trailersMovie,
        trailerMovieState,
        trailerMovieErrorMessage,
        castActors,
        castActorsState,
        castActorsErrorMessage,
      ];
}
