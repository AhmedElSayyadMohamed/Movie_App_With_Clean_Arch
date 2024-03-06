import 'package:movie_app_with_clean_arch/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

class MoviesRepository implements BaseMoviesRepository{
  final BaseRemoteMovieDataSource _baseRemoteMovieDataSource;
  MoviesRepository(this._baseRemoteMovieDataSource);


  @override
  Future<List<Movie>> getNowPlaying()async {
    return await _baseRemoteMovieDataSource.getNowPlayingMovies();
  }

  @override
  Future<List<Movie>> getPopular()async {
    return await _baseRemoteMovieDataSource.getPopularMovies();
  }

  @override
  Future<List<Movie>> getTopRated() async {
    return await _baseRemoteMovieDataSource.getTopRatedMovies();
  }
}