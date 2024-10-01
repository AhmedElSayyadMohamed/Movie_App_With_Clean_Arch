class ApiConstance{

  static const String baseUrl ='https://api.themoviedb.org/3';
  static const String youtubeBaseUrl ='https://www.youtube.com/watch?v=';
  static const String apiKey='c3435cfe40aeb079689227d82bf921d3';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
  static String getMovieDetails(int movieId) => '/movie/$movieId?api_key=$apiKey';
  static String getRecommendations(int movieId) => '/movie/$movieId/recommendations?api_key=$apiKey';
  static String getTrailerMovie(int movieId) => '/movie/$movieId/videos?api_key=$apiKey';
  static String getCastByMovieId(int id) => "/movie/$id/credits?api_key=$apiKey";
}
class EndPoints{
  static String getNowPlaying(int page) =>'/movie/now_playing?api_key=${ApiConstance.apiKey}&page=$page';
  static String getPopular(int page) =>'/movie/popular?api_key=${ApiConstance.apiKey}&page=$page';
  static String getTopRated(int page) =>'/movie/top_rated?api_key=${ApiConstance.apiKey}&page=$page';
}