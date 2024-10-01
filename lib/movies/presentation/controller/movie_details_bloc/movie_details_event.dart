import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  GetMovieDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}
class GetRecommendationsEvent extends MovieDetailsEvent {
  final int id;
  GetRecommendationsEvent(this.id);
  @override
  List<Object> get props => [id];
}
class GetTrailersMovieEvent extends MovieDetailsEvent {
  final int movieId;
  GetTrailersMovieEvent(this.movieId);
  @override
  List<Object> get props => [movieId];
}
class GetMovieCastEvent extends MovieDetailsEvent {
  final int movieId;
  GetMovieCastEvent(this.movieId);
  @override
  List<Object> get props => [movieId];
}
