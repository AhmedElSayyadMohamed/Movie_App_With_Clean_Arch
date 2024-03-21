import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/states/movie_states.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../core/utiles/share_functions.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/events/movies_events.dart';
import '../../shared_widgets/now_playing_movie_widgets/now_playing_movies_component.dart';
import '../../shared_widgets/popular_widgets/popular_movies_component.dart';
import '../../shared_widgets/title_and_see_more_widget.dart';
import '../../shared_widgets/top_rated_widgets/top_rated_movies_component.dart';
import '../all_popular_movies_screen/all_popular_movies_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator.adaptive(
        color: Colors.indigo,
        onRefresh: ()async{
          sl<MoviesBloc>().add(RefreshHomeScreenEvent());
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<MoviesBloc,MoviesStates>(
            builder: (BuildContext context, MoviesStates state) {
              var bloc = BlocProvider.of<MoviesBloc>(context);

              if(bloc.topMovies.isNotEmpty &&
                  bloc.nowPlayingMovies.isNotEmpty&&
                  bloc.popMovies.isNotEmpty) {
                return  Column(
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
              );
              }
              else {
                return Center(
                  child: SizedBox(
                      height:600,
                      child: Lottie.asset('assets/lottie/lottie_loading.json'),
                  ), // Load animation from assets
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
