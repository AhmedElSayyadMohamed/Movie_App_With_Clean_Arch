import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/utiles/string_manager/string_manager.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/states/movie_states.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/first_nav_bar_item_movies_screen/widgets/lottie_loading.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/space_widgets/vertical_widget.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../core/utiles/share_functions.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/events/movies_events.dart';
import '../../shared_widgets/now_playing_movie_widgets/now_playing_movies_component.dart';
import '../../shared_widgets/popular_widgets/popular_movies_component.dart';
import '../../shared_widgets/title_and_see_more_widget.dart';
import '../../shared_widgets/top_rated_widgets/top_rated_movies_component.dart';
import '../all_popular_movies_screen/all_popular_movies_screen.dart';
import '../all_top_rated_movies_screen/all_top_rated_movies_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<MoviesBloc, MoviesStates>(
            builder: (BuildContext context, MoviesStates state) {
              var bloc = MoviesBloc.get(context);

              if (bloc.topMovies.isNotEmpty ||
                  bloc.nowPlayingMovies.isNotEmpty ||
                  bloc.popMovies.isNotEmpty) {
                return Column(
                  children: [
                    const NowPlayingMoviesComponent(),
                    TitleAndSeeMoreWidget(
                      title: StringManager.popular,
                      onTap:()=>onTapSeeMorePopular(context),
                    ), // static
                    const PopularMoviesComponent(), // rebuild
                    TitleAndSeeMoreWidget(
                      title: StringManager.topRated,
                      onTap: ()=>onTapSeeMoreTopRated(context) ,
                    ), // static
                    const TopRatedMoviesComponent(), // rebuild// rebuild
                    const VerticalSpace(
                      pixels: 15,
                    ),
                  ],
                );
              } else {
                return const LottieLoadingIndicator();
              }
            },
          ),
        ),
      );
  }

  Future<void>  _refresh() async {
    sl<MoviesBloc>().add(RefreshHomeScreenEvent());
  }

  onTapSeeMorePopular(context){
      navigatePushTo(const AllPopularMoviesScreen(), context);
  }
  onTapSeeMoreTopRated(context){
      navigatePushTo(const AllTopRatedMoviesScreen(), context);
  }
}
