import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      MovieModel(
          id: json['id'],
          backdropPath: json['backdrop_path'],
          title: json['title'],
          overview: json['overview'],
          voteAverage: json['vote_average'],
          releaseDate: json['release_date'],
          genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
      );
}
