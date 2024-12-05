import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:movie_app_with_clean_arch/main.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../../../domain/entity/movie.dart';

const String watchLaterBox = 'watchLaterBox';

class HiveDataBase {
  // HiveDataBase._();
  Future<void> init() async {
    // Get application documents directory
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    // Initialize Hive
    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(MovieAdapter());
    Hive.registerAdapter(GenresAdapter());
  }

  void addMovieToDB({required Movie movie}) async {
    var favMovies = Hive.box<Movie>(watchLaterBox);

    favMovies.put(movie.id, movie)
        .then(
          (value) => debugPrint('movie ${movie.title} added to database'),
        )
        .catchError((error) {
      debugPrint('error when try to add movie ${movie.title} to database');
    });
  }



  Future<void> removeMovieFromDatabase({required Movie movie}) async {
    var favMovies = Hive.box<Movie>(watchLaterBox);

    favMovies
        .delete(movie.id)
        .then(
          (value) => debugPrint('movie ${movie.title} removed from database'),
    )
        .catchError((error) {
      debugPrint('error when try to add movie ${movie.title} to database');
    });
  }

  Future<List<Movie>> getFavMoviesFromDB() async {
    var favMovies = Hive.box<Movie>(watchLaterBox);

    return favMovies.values.toList();
  }
}
