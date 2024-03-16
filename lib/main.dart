import 'package:flutter/material.dart';
import 'core/services_locator/services_locator.dart';
import 'movies/presentation/application_root/movie_app.dart';

void main() {

  ServicesLocator.init();
  runApp( const MovieApp());
}

