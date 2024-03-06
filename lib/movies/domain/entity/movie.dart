import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final double voteAverage;
  final double releaseDate;
  final List<int> genreIds;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.genreIds,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        title,
        overview,
        voteAverage,
        releaseDate,
        genreIds,
      ];
}
