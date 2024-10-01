import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/genres.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? backdropPath;

  @HiveField(2)
  final String? posterPath;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String overview;

  @HiveField(5)
  final double voteAverage;

  @HiveField(6)
  final String releaseDate;

  @HiveField(7)
  bool isFavourite;

  @HiveField(8)
  final List<Genres> genres;

  @HiveField(9)
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
class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    return Movie(
      id: reader.readInt(),
      backdropPath: reader.readString(),
      posterPath: reader.readString(),
      title: reader.readString(),
      overview: reader.readString(),
      voteAverage: reader.readDouble(),
      releaseDate: reader.readString(),
      isFavourite: reader.readBool(),
      genres: List<Genres>.from(reader.readList().map((dynamic e) => e as Genres)),
      language: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.backdropPath!);
    writer.writeString(obj.posterPath!);
    writer.writeString(obj.title);
    writer.writeString(obj.overview);
    writer.writeDouble(obj.voteAverage);
    writer.writeString(obj.releaseDate);
    writer.writeBool(obj.isFavourite);
    writer.writeList(obj.genres);
    writer.writeString(obj.language);
  }
}
class GenresAdapter extends TypeAdapter<Genres> {
  @override
  final int typeId = 1;

  @override
  Genres read(BinaryReader reader) {
    return Genres(
      id: reader.readInt(),
      name: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Genres obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
  }
}