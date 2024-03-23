part of 'general_bloc.dart';

@immutable
abstract class GeneralEvent {}
class ToggleBottomNavBarItemEvent extends GeneralEvent {
  final int index;
  ToggleBottomNavBarItemEvent(this.index);
}

class ToggleFavouriteEvent extends GeneralEvent {
  Movie movie;
  ToggleFavouriteEvent(this.movie);
}
