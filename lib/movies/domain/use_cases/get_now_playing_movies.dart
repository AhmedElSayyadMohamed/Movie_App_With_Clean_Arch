import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/base_use_cases.dart';

import '../../../core/error/failure/failure.dart';

class GetNowPlayingMovies extends BaseUseCases<List<Movie>>{
  final BaseMoviesRepository _baseMoviesRepository;
  GetNowPlayingMovies(this._baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call()=> _baseMoviesRepository.getNowPlaying();

}
