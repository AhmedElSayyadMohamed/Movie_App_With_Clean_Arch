
import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/trailer_movie.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_details_use_cases/movie_details_use_cases.dart';
import 'movie_details_use_cases/get_movie_details.dart';

class GetTrailerForAMovie extends BaseMovieDetailsUseCases<TrailerMovie,Parameters>{

  final BaseMoviesRepository _baseMoviesRepository;

  GetTrailerForAMovie(this._baseMoviesRepository);

  @override
  Future<Either<Failure, TrailerMovie>> call({required Parameters parameter}) {
    return _baseMoviesRepository.getTrailerForAMovie(movieId:parameter.movieId);

  }
}