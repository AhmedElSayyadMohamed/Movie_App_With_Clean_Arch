import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/network/server_error_exception.dart';
import 'package:movie_app_with_clean_arch/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

import '../../../core/error/failure/failure.dart';

class MoviesRepository implements BaseMoviesRepository {

  final BaseRemoteMovieDataSource _baseRemoteMovieDataSource;
  MoviesRepository(this._baseRemoteMovieDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    var result = await _baseRemoteMovieDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerErrorException catch (failure) {
      return Left(ServerFailure(failure.serverErrorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopular() async{
    var result = await _baseRemoteMovieDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerErrorException catch (failure) {
      return Left(ServerFailure(failure.serverErrorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRated()async {
    var result = await _baseRemoteMovieDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerErrorException catch (failure) {
      return Left(ServerFailure(failure.serverErrorModel.message));
    }
  }
}
