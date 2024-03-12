import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';


abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlaying();
  Future<Either<Failure,List<Movie>>> getPopular();
  Future<Either<Failure,List<Movie>>> getTopRated();
}