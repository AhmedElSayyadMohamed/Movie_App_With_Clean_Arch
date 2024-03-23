import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/movie.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  int selectedBottomNavIndex = 0;
  List<Movie> favouriteMovies = [];

  static GeneralBloc get(context) => BlocProvider.of(context);

  /////////////////////////////////////////////

  GeneralBloc() : super(GeneralInitial()) {
    on<ToggleBottomNavBarItemEvent>(_onBottomNavItemTapped);
    on<ToggleFavouriteEvent>(_toggleFavourite);
  }

  FutureOr<void> _onBottomNavItemTapped(
    ToggleBottomNavBarItemEvent event,
    Emitter<GeneralState> emit,
  ) {
    selectedBottomNavIndex = event.index;
    emit(ToggleBottomNavBarItem(selectedBottomNavIndex));
  }

  FutureOr<void> _toggleFavourite(
    ToggleFavouriteEvent event,
    Emitter<GeneralState> emit,
  ) {
    event.movie.isFavourite = !event.movie.isFavourite;
    emit(ToggleFavourite());

    if (event.movie.isFavourite == true) {
      favouriteMovies.add(event.movie);
      emit(AddMovieToFavourite());
    } else {
      favouriteMovies.remove(event.movie);
      emit(RemoveMovieFromFavourite());
    }
    if (kDebugMode) {
      print('fav : ${favouriteMovies.length}');
    }
  }
}
