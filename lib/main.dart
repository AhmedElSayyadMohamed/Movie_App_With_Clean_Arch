import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'core/services_locator/services_locator.dart';
import 'movies/data/data_source/local/hive_database.dart';
import 'movies/domain/entity/movie.dart';
import 'movies/presentation/application_root/movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator.init();
  await sl<HiveDataBase>().init();
  await Hive.openBox<Movie>(watchLaterBox);

  // Bloc.observer = SimpleBlocObserver();

  runApp(const MovieApp());
}
