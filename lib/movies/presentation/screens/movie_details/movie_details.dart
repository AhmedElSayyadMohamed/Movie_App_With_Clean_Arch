import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_event.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../domain/entity/movie.dart';
import '../../shared_widgets/movie_cast_component/movie_cast_component.dart';
import '../../shared_widgets/movie_details_screen_widgets/movie_details_component.dart';
import '../../shared_widgets/movie_details_screen_widgets/movie_trial_widget.dart';
import '../../shared_widgets/movie_details_screen_widgets/recommendation_movies_components.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailsScreen({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (BuildContext context) => sl<MovieDetailsBloc>()
        ..add(GetTrailersMovieEvent(movie.id))
        ..add(GetMovieDetailsEvent(movie.id))
        ..add(GetRecommendationsEvent(movie.id))
        ..add(GetMovieCastEvent(movie.id)),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieTrialWidget(
                  movie: movie,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 12.0,
                    end: 12,
                    top: 15,
                  ),
                  child: Column(
                    children: [
                      MovieDetailsComponent(
                        movie: movie,
                      ),
                      const MovieCastComponent(),
                      const RecommendationMoviesComponents(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
