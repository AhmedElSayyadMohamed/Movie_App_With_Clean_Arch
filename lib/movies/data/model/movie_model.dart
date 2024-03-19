import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path']??'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
        title: json['title'],
        overview: json['overview'],
        voteAverage: json['vote_average'],
        releaseDate: json['release_date'],
        posterPath: json['poster_path']??'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
      );
}
