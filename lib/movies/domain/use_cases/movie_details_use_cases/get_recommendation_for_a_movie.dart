import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/base_use_cases.dart';

class GetRecommendationForAMovie extends BaseUseCases{

  final BaseMoviesRepository _baseMoviesRepository;

  GetRecommendationForAMovie(this._baseMoviesRepository);

  @override
  Future<Either<Failure, dynamic>> call() {
    return _baseMoviesRepository.getRecommendationForAMovie();
  }
}