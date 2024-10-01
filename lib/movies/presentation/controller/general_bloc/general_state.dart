part of 'general_bloc.dart';

@immutable
abstract class GeneralState {}

class GeneralInitial extends GeneralState {}

class ToggleBottomNavBarItem extends GeneralState{
  int navBarItemIndex ;

  ToggleBottomNavBarItem(this.navBarItemIndex);
}

class ToggleFavourite extends GeneralState{}

class AddMovieToFavourite extends GeneralState{}

class RemoveMovieFromFavourite extends GeneralState{}
class CheckInternetConnection extends GeneralState{}
