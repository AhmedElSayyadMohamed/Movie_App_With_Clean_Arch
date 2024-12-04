import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services_locator/services_locator.dart';
import 'movies/data/data_source/local/hive_database.dart';
import 'movies/presentation/application_root/movie_app.dart';
import 'movies/presentation/controller/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator.init();
  sl<HiveDataBase>().initHive();
  Bloc.observer = SimpleBlocObserver();

  //  await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MovieApp());
}
