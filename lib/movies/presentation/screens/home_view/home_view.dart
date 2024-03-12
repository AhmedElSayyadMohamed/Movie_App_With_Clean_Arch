import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/services_locator/services_locator.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/events/movies_events.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/now_playing_movie_widgets/now_playing_movies_component.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/popular_and_top_rated_widgets/popular_movies_component.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/popular_and_top_rated_widgets/top_rated_movies_component.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/title_and_see_more_widget.dart';


class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (BuildContext context) =>
      sl<MoviesBloc>()
        ..add(GetPlayingNowMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: const Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                NowPlayingMoviesComponent(), // rebuild
                TitleAndSeeMoreWidget(
                  title: 'Popular',
                ) , // static
                PopularMoviesComponent(),// rebuild
                TitleAndSeeMoreWidget(
                  title: 'Top Rated',
                ),// static
                TopRatedMoviesComponent(),// rebuild
                SizedBox(height: 15
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}