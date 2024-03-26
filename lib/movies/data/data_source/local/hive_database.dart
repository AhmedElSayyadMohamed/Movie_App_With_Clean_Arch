import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../../../domain/entity/movie.dart';

class HiveDataBase{

  Future<void> initHive() async {

    // Get application documents directory
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

    // Initialize Hive
    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(MovieAdapter());
    Hive.registerAdapter(GenresAdapter());
    openMovieBox(boxKey: 'favouriteMovies');
  }

  Future<void> openMovieBox({required String boxKey}) async {
     await Hive.openBox<List<Movie>>(boxKey);
  }

  void saveMovies({required List<Movie> movies}) async{
    var favMovies = await Hive.openBox<List<Movie>>('favouriteMovies');

    // Get the Hive box// Clear existing objects
    // favMovies.clear();
    // Save each object in the list to the box
    favMovies.add(movies).then((value) => debugPrint('movie ${movies.length} added to database'));
   var list = getFavouriteBox() ;
   print(list);
  }

  Future<List<Movie>?> getFavouriteBox() async {
    Box<List<Movie>> box = await Hive.openBox<List<Movie>>('favouriteMovies');
    print(box.length);
    return box.get('favouriteMovies');
  }
}