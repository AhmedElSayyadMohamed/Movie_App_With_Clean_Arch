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
