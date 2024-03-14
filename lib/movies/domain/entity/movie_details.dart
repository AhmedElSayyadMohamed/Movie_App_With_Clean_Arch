import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String image;
  final String title;
  final List<Genres> genres;
  final String description;
  final String releaseDate;
  final int runtimeInSecond;
  final String language;
  final double voteAverage;
  final int voteCount;

  const MovieDetails({
    required this.id,
    required this.image,
    required this.title,
    required this.genres,
    required this.description,
    required this.releaseDate,
    required this.runtimeInSecond,
    required this.language,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props => [
        id,
        image,
        title,
        genres,
        description,
        releaseDate,
        runtimeInSecond,
        language,
        voteAverage,
        voteCount,
      ];
}
