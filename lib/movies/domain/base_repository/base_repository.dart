import 'package:movie_app_with_clean_arch/movies/domain/entity.dart';

abstract class BaseMoviesRepository{
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopular();
  Future<List<Movie>> getTopRated();


}