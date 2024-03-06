import 'package:dio/dio.dart';
import 'package:movie_app_with_clean_arch/core/apiconstance.dart';
import 'package:movie_app_with_clean_arch/core/error/server_error_model.dart';
import 'package:movie_app_with_clean_arch/core/network/server_error_exception.dart';
import 'package:movie_app_with_clean_arch/movies/data/model/movie_model.dart';

abstract class BaseRemoteMovieDataSource{

  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}
class RemoteMovieDataSource extends BaseRemoteMovieDataSource{
   late final Dio _dio ;

   RemoteMovieDataSource(){
     _dio = Dio(BaseOptions(
         baseUrl: ApiConstance.baseUrl,
     receiveTimeout: const Duration(milliseconds: 1000),
     ),);
   }
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async{
    var response = await _dio.get('${EndPoints.nowPlaying}${ApiConstance.apiKey}');
    if(response.statusCode==200) {
      return List<MovieModel>.from(response.data['results'].map((e)=>MovieModel.fromJson(e)));
    }
    else {
      throw ServerErrorException(
        serverErrorModel: ServerErrorModel(
          statusCode: response.data['status_code'],
          message:response.data['status_message'],
          success: response.data['success'],
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    var response = await _dio.get('${EndPoints.popular}${ApiConstance.apiKey}');
    if(response.statusCode==200) {
      return List<MovieModel>.from(response.data['results'].map((e)=>MovieModel.fromJson(e)));
    }
    else {
      throw ServerErrorException(
         serverErrorModel: ServerErrorModel(
           statusCode: response.data['status_code'],
           message:response.data['status_message'],
           success: response.data['success'],
         ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies()  async{
    var response = await _dio.get('${EndPoints.topRated}${ApiConstance.apiKey}');
    if(response.statusCode==200) {
      return List<MovieModel>.from(response.data['results'].map((e)=>MovieModel.fromJson(e)));
    }
    else {
      throw ServerErrorException(
        serverErrorModel: ServerErrorModel(
          statusCode: response.data['status_code'],
          message:response.data['status_message'],
          success: response.data['success'],
        ),
      );
    }
  }
}