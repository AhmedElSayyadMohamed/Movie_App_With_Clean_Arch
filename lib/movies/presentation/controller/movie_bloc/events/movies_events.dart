import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPlayingNowMoviesEvent extends MoviesEvents {
  final int page ;

  GetPlayingNowMoviesEvent({this.page=0});
}

class GetPopularMoviesEvent extends MoviesEvents {
  int page;
  GetPopularMoviesEvent({this.page = 0 });
}

class GetTopRatedMoviesEvent extends MoviesEvents {
  final int page ;

  GetTopRatedMoviesEvent({this.page=0});
}
class RefreshHomeScreenEvent extends MoviesEvents {

  RefreshHomeScreenEvent();
}