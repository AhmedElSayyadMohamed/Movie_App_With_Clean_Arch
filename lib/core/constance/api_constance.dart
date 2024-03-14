class ApiConstance{

  static const String baseUrl ='https://api.themoviedb.org/3';
  static const String youtubeBaseUrl ='https://www.youtube.com/watch?v=';
  static const String apiKey='c3435cfe40aeb079689227d82bf921d3';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
  static String getMovieDetails(int movieId) => '/movie/$movieId?api_key=$apiKey';
}
class EndPoints{
  static const String nowPlaying ='/movie/now_playing?api_key=${ApiConstance.apiKey}&page = 2';
  static const String popular ='/movie/popular?api_key=${ApiConstance.apiKey}';
  static const String topRated ='/movie/top_rated?api_key=${ApiConstance.apiKey}';

}