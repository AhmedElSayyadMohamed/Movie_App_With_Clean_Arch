import 'package:get_it/get_it.dart';
import 'package:movie_app_with_clean_arch/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movie_app_with_clean_arch/movies/data/repository/movies_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/get_now_playing_movies.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/get_popular_movies.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/get_top_rated_movies.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/bloc/movies_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator{

  static init(){

    // bloc
    sl.registerLazySingleton(() =>MoviesBloc(sl()));
    //use cases
    sl.registerLazySingleton(() =>GetNowPlayingMovies(sl()));
    sl.registerLazySingleton(() =>GetPopularMovies(sl()));
    sl.registerLazySingleton(() =>GetTopRatedMovies(sl()));
    //Data Source
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(() =>RemoteMovieDataSource());
    //Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() =>MoviesRepository(sl()));
  }



  //



}