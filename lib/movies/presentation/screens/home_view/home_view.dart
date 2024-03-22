import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/services_locator/services_locator.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/states/movie_states.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/home_view/widgets/nav_bar_items.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/home_view/widgets/nav_bar_items_screens.dart';
import '../../../../core/utiles/responsive/responsive.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/events/movies_events.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);

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
          var bloc = MoviesBloc.get(context);
          return Scaffold(
            body: SafeArea(
                child: screens[bloc.selectedBottomNavIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 3,
              items: items,
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
