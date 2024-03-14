import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_details_use_cases/get_movie_details.dart';
import 'core/services_locator/services_locator.dart';
import 'movies/presentation/application_root/movie_app.dart';

void main() {

  ServicesLocator.init();
   // GetMovieDetails(sl()).call(movieId: 22);
  runApp( const MovieApp());
}

