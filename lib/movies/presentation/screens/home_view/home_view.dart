import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/services_locator/services_locator.dart';
import 'package:movie_app_with_clean_arch/core/utiles/share_functions.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/all_popular_movies_screen/all_popular_movies_screen.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/now_playing_movie_widgets/now_playing_movies_component.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/title_and_see_more_widget.dart';
import '../../../../core/constance/request_enum.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/events/movies_events.dart';
import '../../controller/movie_bloc/states/movie_states.dart';
import '../../shared_widgets/popular_widgets/popular_movies_component.dart';
import '../../shared_widgets/top_rated_widgets/top_rated_movies_component.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    print('MovieView build');
    return BlocProvider<MoviesBloc>(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetPlayingNowMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator.adaptive(
            color: Colors.indigo,
            onRefresh: ()async{
              sl<MoviesBloc>().add(RefreshHomeScreenEvent());
              },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const NowPlayingMoviesComponent(),
                  TitleAndSeeMoreWidget(
                    title: 'Popular',
                    onTap: () {
                      navigatePushTo(const AllPopularMoviesScreen(), context);
                    },
                  ), // static
                  const PopularMoviesComponent(), // rebuild
                  TitleAndSeeMoreWidget(
                    title: 'Top Rated',
                    onTap: () {
                      navigatePushTo(const AllPopularMoviesScreen(), context);
                    },
                  ), // static
                  const TopRatedMoviesComponent(), // rebuild// rebuild
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
