import 'package:dio/dio.dart';
import 'package:movie_app_with_clean_arch/core/constance/api_constance.dart';
import 'package:movie_app_with_clean_arch/core/error/server_error_model.dart';
import 'package:movie_app_with_clean_arch/core/network/server_error_exception.dart';
import 'package:movie_app_with_clean_arch/movies/data/model/actor_model.dart';
import 'package:movie_app_with_clean_arch/movies/data/model/movie_model.dart';
import 'package:movie_app_with_clean_arch/movies/data/model/trialer_movie_model.dart';


abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovies({required int page});
  Future<List<MovieModel>> getPopularMovies({required int page});
  Future<List<MovieModel>> getTopRatedMovies({required int page});
  Future<List<MovieModel>> getRecommendations({required int movieId});
  Future<MovieModel> getMovieDetails({required int movieId});
  Future<List<TrailerMovieModel>> getTrailerMovie({required int movieId});
  Future<List<ActorModel>> getMovieCast({required int movieId});
}

class RemoteMovieDataSource extends BaseRemoteMovieDataSource {
  late final Dio _dio;
  RemoteMovieDataSource() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        // receiveTimeout: const Duration(milliseconds: 1000),
      ),
    );
  }
  @override
  Future<List<MovieModel>> getNowPlayingMovies({required int page}) async {
    var response = await _dio.get(EndPoints.getNowPlaying(page));
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
  Future<List<MovieModel>> getPopularMovies({required int page}) async {
    var response = await _dio.get(EndPoints.getPopular(page));
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
  Future<List<MovieModel>> getTopRatedMovies({required int page}) async {
    var response = await _dio.get(EndPoints.getTopRated(page));
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
  Future<MovieModel> getMovieDetails({required int movieId}) async {
    var response = await _dio.get(ApiConstance.getMovieDetails(movieId));
    if (response.statusCode == 200) {
      // print(response.data);
      return MovieModel.fromJson(
          response.data,
          genres:response.data['genres'],
          lang:response.data['spoken_languages'][0]['english_name'],
      );
    } else {
      throw ServerErrorException(
        serverErrorModel: ServerErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getRecommendations({required int movieId}) async {
    var response = await _dio.get(ApiConstance.getRecommendations(movieId));
    if (response.statusCode == 200) {
      return List.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerErrorException(
        serverErrorModel: ServerErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TrailerMovieModel>> getTrailerMovie(
      {required int movieId}) async {
    var response = await _dio.get(ApiConstance.getTrailerMovie(movieId));
    if (response.statusCode == 200) {
      return List<TrailerMovieModel>.from(
          (response.data['results'] as List<dynamic>)
              .where((e) => (e as Map<String, dynamic>)['name']
                  .toLowerCase()
                  .contains('trailer'))
              .map((e) => TrailerMovieModel.fromJson(e)));
    } else {
      throw ServerErrorException(
        serverErrorModel: ServerErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ActorModel>> getMovieCast({required int movieId}) async {
    var response = await _dio.get(ApiConstance.getCastByMovieId(movieId));
    if (response.statusCode == 200) {
      return List<ActorModel>.from(
        (response.data['cast'] as List<dynamic>).map(
          (e) => ActorModel.fromJson(e),
        ),
      );
    } else {
      throw ServerErrorException(
        serverErrorModel: ServerErrorModel.fromJson(response.data),
      );
    }
  }
}
