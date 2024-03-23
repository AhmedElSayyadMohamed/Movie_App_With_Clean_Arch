import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';

import 'movie_details_model.dart';

class MovieModel extends Movie {
   MovieModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.posterPath,
     super.isFavourite,
     required super.genres,
     required super.language,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json,
      {List genres=const[], String lang=''}) => MovieModel(
        isFavourite: false,
        id: json['id'],
        backdropPath: json['backdrop_path'],
        title: json['title'],
        overview: json['overview'],
        voteAverage: json['vote_average'],
        releaseDate: json['release_date'],
        posterPath: json['poster_path'],
        genres:genres.isEmpty?[]:List.from(genres.map((element) => GenresModel.fromJson(element))),
        language: lang ==''?'':lang,
      );
}
