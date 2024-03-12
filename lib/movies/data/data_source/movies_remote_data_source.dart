import 'package:dio/dio.dart';
import 'package:movie_app_with_clean_arch/core/constance/api_constance.dart';
import 'package:movie_app_with_clean_arch/core/error/server_error_model.dart';
import 'package:movie_app_with_clean_arch/core/network/server_error_exception.dart';
import 'package:movie_app_with_clean_arch/movies/data/model/movie_model.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class RemoteMovieDataSource extends BaseRemoteMovieDataSource {
  late final Dio _dio;
   RemoteMovieDataSource(){
     _dio = Dio(
       BaseOptions(
         baseUrl: ApiConstance.baseUrl,
         // receiveTimeout: const Duration(milliseconds: 1000),
       ),
     );
}



  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {

    var response = await _dio.get(EndPoints.nowPlaying);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerErrorException(
        serverErrorModel: ServerErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var response = await _dio.get(EndPoints.popular);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerErrorException(
        serverErrorModel: ServerErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var response = await _dio.get(EndPoints.topRated);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerErrorException(
        serverErrorModel: ServerErrorModel.fromJson(response.data),
      );
    }
  }
}
