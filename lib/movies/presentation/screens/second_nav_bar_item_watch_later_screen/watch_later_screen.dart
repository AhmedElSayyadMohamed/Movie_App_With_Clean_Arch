import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../core/utiles/string_manager/string_manager.dart';
import '../../controller/watch_later_cubit/watch_later_cubit.dart';
import '../../controller/watch_later_cubit/watch_later_states.dart';
import '../../shared_widgets/all_movies_card.dart';

class WatchLaterScreen extends StatelessWidget {
  const WatchLaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<WatchLaterMoviesCubit>()..getFavMoviesFromDataBase(),
      child: BlocBuilder<WatchLaterMoviesCubit, WatchLaterMoviesStates>(
        builder: (BuildContext context, state) {
          switch (state) {
            case GetFavMoviesFromDatabaseLoadingState():
              return const CircularProgressIndicator();
            case GetFavMoviesFromDatabaseSuccessState():
              return Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 20,
                  start: 10,
                  end: 10,
                ),
                child: Column(
                  children: [
                    Text(
                      StringManager.watchList,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            sl<WatchLaterMoviesCubit>().dbFavMovies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie:
                                sl<WatchLaterMoviesCubit>().dbFavMovies[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            case GetFavMoviesFromDatabaseErrorState():
              const Text('there are an Error when get data from db');
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
