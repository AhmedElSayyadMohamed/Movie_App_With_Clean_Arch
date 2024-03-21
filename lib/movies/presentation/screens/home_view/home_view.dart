import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/services_locator/services_locator.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/states/movie_states.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/events/movies_events.dart';
import '../movies_screen/movies_screen.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('MovieView build');
    }

    return BlocProvider<MoviesBloc>(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetPlayingNowMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesStates>(
        builder: (BuildContext context, MoviesStates state) {
          var bloc = BlocProvider.of<MoviesBloc>(context);
          return Scaffold(
            body: bloc.screens[bloc.selectedBottomNavIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 3,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.movie_outlined),
                  activeIcon: Icon(Icons.movie),
                  label: 'Movies',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_max),
                  activeIcon: Icon(Icons.home_max_outlined),
                  label: 'Watch',
                ),
              ],
              currentIndex: state.toggleBottomNavBarItem,
              onTap: (index) {
                bloc.add(ToggleBottomNavBarItemEvent(index));
              },
            ),
          );
        },
      ),
    );
  }
}
