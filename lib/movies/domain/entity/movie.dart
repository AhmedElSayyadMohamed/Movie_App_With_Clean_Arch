import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/genres.dart';

class Movie extends Equatable {
  final int id;
  final String? backdropPath;
  final String? posterPath;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  bool isFavourite;
  final List<Genres> genres;
  final String language;

  Movie({
    required this.genres,
    required this.language,
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
        genres,
        language,
      ];
}
