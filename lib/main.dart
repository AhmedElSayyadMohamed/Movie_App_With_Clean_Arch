import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services_locator/services_locator.dart';
import 'movies/presentation/application_root/movie_app.dart';
import 'movies/presentation/controller/bloc_observer.dart';

void main() {

  ServicesLocator.init();
  Bloc.observer = SimpleBlocObserver();

  runApp(const MovieApp());
}

