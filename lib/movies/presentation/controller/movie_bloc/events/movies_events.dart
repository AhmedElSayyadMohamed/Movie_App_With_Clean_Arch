import 'package:equatable/equatable.dart';


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

