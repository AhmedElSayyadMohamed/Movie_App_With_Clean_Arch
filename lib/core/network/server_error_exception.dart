import 'package:movie_app_with_clean_arch/core/error/server_error_model.dart';

class ServerErrorException implements Exception{
  final ServerErrorModel serverErrorModel;
  ServerErrorException({required this.serverErrorModel});
}

