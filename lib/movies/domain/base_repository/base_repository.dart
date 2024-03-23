import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/actor.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/trailer_movie.dart';


abstract class BaseMoviesRepository{

  Future<Either<Failure,List<Movie>>> getNowPlaying({required int? page});
  Future<Either<Failure,List<Movie>>> getPopular({required int? page});
  Future<Either<Failure,List<Movie>>> getTopRated({required int? page});
  Future<Either<Failure,List<Movie>>> getRecommendationForAMovie({required int movieId});
  Future<Either<Failure,Movie>> getMovieDetails({required int movieId});
  Future<Either<Failure,List<TrailerMovie>>> getTrailerForAMovie({required int movieId});
  Future<Either<Failure,List<Actor>>> getMovieCast({required int movieId});
}