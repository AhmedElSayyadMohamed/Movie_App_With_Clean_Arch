import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

class GetPopularMovies {
  final BaseMoviesRepository _baseMoviesRepository;
  GetPopularMovies(this._baseMoviesRepository);

  Future<List<Movie>> execute()=> _baseMoviesRepository.getNowPlaying();
}
