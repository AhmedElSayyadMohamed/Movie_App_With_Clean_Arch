import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  bool isFavourite;
  final String? backdropPath;
  final String? posterPath;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  Movie({
    this.isFavourite = false,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.posterPath,
  });

  @override
  List<Object?> get props =>
      [
        id,
        backdropPath,
        posterPath,
        title,
        overview,
        voteAverage,
        releaseDate,
      ];
}
