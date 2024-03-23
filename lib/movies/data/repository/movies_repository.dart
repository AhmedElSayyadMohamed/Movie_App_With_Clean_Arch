import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/network/server_error_exception.dart';
import 'package:movie_app_with_clean_arch/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/actor.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie_details.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/trailer_movie.dart';
import '../../../core/error/failure/failure.dart';

class MoviesRepository implements BaseMoviesRepository {

  final BaseRemoteMovieDataSource _baseRemoteMovieDataSource;
  MoviesRepository(this._baseRemoteMovieDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying({required int? page}) async {
    var result = await _baseRemoteMovieDataSource.getNowPlayingMovies(page: page!);
    try {
      return Right(result);
    } on ServerErrorException catch (failure) {
      return Left(ServerFailure(failure.serverErrorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopular({required int? page}) async{
    var result = await _baseRemoteMovieDataSource.getPopularMovies(page: page!);
    try {
      return Right(result);
    } on ServerErrorException catch (failure) {
      return Left(ServerFailure(failure.serverErrorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRated({required int? page})async {
    var result = await _baseRemoteMovieDataSource.getTopRatedMovies(page: page!);
    try {
      return Right(result);
    } on ServerErrorException catch (failure) {
      return Left(ServerFailure(failure.serverErrorModel.message));
    }
  }


  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails({required int movieId})async {

    final result = await _baseRemoteMovieDataSource.getMovieDetails(movieId: movieId);
    try{
      return Right(result);

    } on ServerErrorException catch(l){
      return Left(ServerFailure(l.serverErrorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<TrailerMovie>>> getTrailerForAMovie({required int movieId})async {
    final result = await _baseRemoteMovieDataSource.getTrailerMovie(movieId: movieId);
    try{
      return Right(result);
    } on ServerErrorException catch(l){
      return Left(ServerFailure(l.serverErrorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getRecommendationForAMovie({required int movieId})async {
    final result = await _baseRemoteMovieDataSource.getRecommendations(movieId: movieId);
    try{
      return Right(result);
    } on ServerErrorException catch(l){
      return Left(ServerFailure(l.serverErrorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Actor>>> getMovieCast({required int movieId}) async{
    final result = await _baseRemoteMovieDataSource.getMovieCast(movieId: movieId);
    try{
      return Right(result);
    } on ServerErrorException catch(l){
      return Left(ServerFailure(l.serverErrorModel.message));
    }
  }

}
