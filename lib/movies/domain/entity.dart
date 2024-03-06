class Movie {
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final double voteAverage;
  final double releaseDate;
  final List<int> genreIds;

  const Movie(
    this.id,
    this.backdropPath,
    this.title,
    this.overview,
    this.voteAverage,
    this.releaseDate,
    this.genreIds,
  );


}
