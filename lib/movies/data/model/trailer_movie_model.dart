import '../../domain/entity/trailer_movie.dart';

class TrailerMovieModel extends TrailerMovie {
  const TrailerMovieModel({required super.id, required super.key, required super.name});

  factory TrailerMovieModel.fromJson(Map<String, dynamic> json) =>
      TrailerMovieModel(
        id: json['id'],
        key: json['key'],
        name: json['name'],
      );

}
