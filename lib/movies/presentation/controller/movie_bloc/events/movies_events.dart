import 'package:equatable/equatable.dart';

import '../../../../domain/entity/movie.dart';
import '../../../../domain/entity/movie_details.dart';

abstract class MoviesEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPlayingNowMoviesEvent extends MoviesEvents {
  int page;

  GetPlayingNowMoviesEvent({this.page = 1});

  @override
  List<Object> get props => [page];
}

class GetPopularMoviesEvent extends MoviesEvents {
  int page;

  GetPopularMoviesEvent({this.page = 1 });

  @override
  List<Object> get props => [];
}

class GetTopRatedMoviesEvent extends MoviesEvents {
  int page;

  GetTopRatedMoviesEvent({this.page = 1});

  @override
  List<Object> get props => [page];
}

class RefreshHomeScreenEvent extends MoviesEvents {

  RefreshHomeScreenEvent();

  @override
  List<Object> get props => [];
}

class ToggleBottomNavBarItemEvent extends MoviesEvents {
  final int index;
  ToggleBottomNavBarItemEvent(this.index);
}
class ToggleFavouriteEvent extends MoviesEvents {
  Movie? movie;
  MovieDetails? movieDetails;
  ToggleFavouriteEvent({this.movie,this.movieDetails});
}
