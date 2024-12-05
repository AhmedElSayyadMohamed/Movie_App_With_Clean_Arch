import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/services_locator/services_locator.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/watch_later_cubit/watch_later_states.dart';

import '../../../data/data_source/local/hive_database.dart';

class WatchLaterMoviesCubit extends Cubit<WatchLaterMoviesStates> {
  WatchLaterMoviesCubit() : super(GetFavMoviesFromDatabaseLoadingState());

  List<Movie> dbFavMovies = [];

  Future<void> getFavMoviesFromDataBase() async {
    dbFavMovies = [];
    emit(GetFavMoviesFromDatabaseLoadingState());
    await sl<HiveDataBase>().getFavMoviesFromDB().then((movies) {
      dbFavMovies = movies;
      emit(GetFavMoviesFromDatabaseSuccessState());
    }).catchError((exception) {
      emit(GetFavMoviesFromDatabaseErrorState());
    });
  }

  void toggleFavourite(Movie movie) {
    movie.isFavourite = !movie.isFavourite;
    emit(ToggleFavouriteState());

    if (movie.isFavourite == true) {
      sl<HiveDataBase>().addMovieToDB(movie: movie);
      getFavMoviesFromDataBase();
      emit(AddMovieToFavouriteState());
    } else if (movie.isFavourite == false) {
      sl<HiveDataBase>().removeMovieFromDatabase(movie: movie);
      getFavMoviesFromDataBase();
      emit(RemoveMovieFromFavouriteState());
    }
  }
}
