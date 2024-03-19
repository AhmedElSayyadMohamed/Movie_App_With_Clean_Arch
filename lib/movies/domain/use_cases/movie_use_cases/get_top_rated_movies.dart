import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/base_use_cases.dart';
import '../../../../core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

import '../movie_details_use_cases/get_movie_details.dart';

class GetTopRatedMovies extends BaseUseCases<List<Movie>,Parameters>{
  final BaseMoviesRepository _baseMoviesRepository;
  GetTopRatedMovies(this._baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call({required Parameters numOfPage})=> _baseMoviesRepository.getTopRated(page: numOfPage.page);

}
