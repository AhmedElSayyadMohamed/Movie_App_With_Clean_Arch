import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final String posterPath;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie( {
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.posterPath,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        title,
        overview,
        voteAverage,
        releaseDate,
      ];
}
