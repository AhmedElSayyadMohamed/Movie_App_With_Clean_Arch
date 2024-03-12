import 'package:dartz/dartz.dart';
import '../../../core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

class GetTopRatedMovies {
  final BaseMoviesRepository _baseMoviesRepository;
  GetTopRatedMovies(this._baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> execute()=> _baseMoviesRepository.getNowPlaying();
}
