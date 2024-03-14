import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie_details.dart';
import 'movie_details_use_cases.dart';

class GetMovieDetails extends BaseMovieDetailsUseCases<MovieDetails>{

  final BaseMoviesRepository _baseMoviesRepository;

  GetMovieDetails(this._baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call({required int movieId}) {
    return _baseMoviesRepository.getMovieDetails(movieId: movieId);
  }
}