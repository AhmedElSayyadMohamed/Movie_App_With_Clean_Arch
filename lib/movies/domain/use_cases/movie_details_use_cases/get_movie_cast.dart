import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/actor.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_details_use_cases/get_movie_details.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_details_use_cases/movie_details_use_cases.dart';

class GetMovieCastUseCase extends BaseMovieDetailsUseCases<List<Actor>,Parameters>{

  final BaseMoviesRepository _baseMoviesRepository;

  GetMovieCastUseCase(this._baseMoviesRepository);

  @override
  Future<Either<Failure, List<Actor>>> call({required Parameters parameter})async {
    return await _baseMoviesRepository.getMovieCast(movieId:parameter.movieId!);
  }

}