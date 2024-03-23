import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/services_locator/services_locator.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/general_bloc/general_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/layout/widgets/nav_bar_items.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/layout/widgets/nav_bar_items_screens.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<GeneralBloc>()),
        BlocProvider(
          create: (context) => sl<MoviesBloc>()
            ..add(GetPlayingNowMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
      ],
      child: BlocBuilder<GeneralBloc, GeneralState>(
        builder: (BuildContext context, GeneralState state) {
          var bloc = GeneralBloc.get(context);
          return Scaffold(
            body: SafeArea(
              child: screens[bloc.selectedBottomNavIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 3,
              items: items,
              currentIndex: bloc.selectedBottomNavIndex,
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
