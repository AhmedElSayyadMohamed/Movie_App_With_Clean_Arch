import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/data/data_source/local/hive_database.dart';

import '../../../../core/network/check_internet_connection.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../domain/entity/movie.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  int selectedBottomNavIndex = 0;
  // List<Movie> favouriteMovies = [];

  static GeneralBloc get(context) => BlocProvider.of(context);

  /////////////////////////////////////////////

  GeneralBloc() : super(GeneralInitial()) {
    on<ToggleBottomNavBarItemEvent>(_onBottomNavItemTapped);
    // on<ToggleFavouriteEvent>(_toggleFavourite);
  }

  FutureOr<void> _onBottomNavItemTapped(
    ToggleBottomNavBarItemEvent event,
    Emitter<GeneralState> emit,
  ) {
    selectedBottomNavIndex = event.index;
    emit(ToggleBottomNavBarItem(selectedBottomNavIndex));
  }
  //
  // FutureOr<void> _toggleFavourite(
  //   ToggleFavouriteEvent event,
  //   Emitter<GeneralState> emit,
  // ) {
  //   event.movie.isFavourite = !event.movie.isFavourite;
  //   emit(ToggleFavourite());
  //
  //   if (event.movie.isFavourite == true) {
  //     sl<HiveDataBase>().saveMovie(movie: event.movie);
  //     emit(AddMovieToFavourite());
  //   } else if (event.movie.isFavourite == false){
  //     sl<HiveDataBase>().removeMovie(movie: event.movie);
  //
  //     emit(RemoveMovieFromFavourite());
  //   }
  //
  // }


  final ConnectivityService _connectivityService = ConnectivityService();

  bool isConnected = true;
  Future<void> checkConnection() async {
    isConnected = await _connectivityService.isConnected();
    // print(isConnected);
    emit(CheckInternetConnection());
  }
}
