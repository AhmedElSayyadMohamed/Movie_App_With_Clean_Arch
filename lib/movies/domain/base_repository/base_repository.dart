import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie_details.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/trailer_movie.dart';


abstract class BaseMoviesRepository{

  Future<Either<Failure,List<Movie>>> getNowPlaying();
  Future<Either<Failure,List<Movie>>> getPopular();
  Future<Either<Failure,List<Movie>>> getTopRated();
  Future<Either<Failure,List<Movie>>> getRecommendationForAMovie({required int movieId});
  Future<Either<Failure,MovieDetails>> getMovieDetails({required int movieId});


  Future<Either<Failure,TrailerMovie>> getTrailerForAMovie({required int movieId});
}