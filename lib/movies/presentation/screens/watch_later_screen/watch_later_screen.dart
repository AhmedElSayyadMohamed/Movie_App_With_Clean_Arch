import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utiles/string_manager/string_manager.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/states/movie_states.dart';
import '../../shared_widgets/all_movies_card.dart';

class WatchLaterScreen extends StatelessWidget {
  const WatchLaterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (prev,current)=>prev.favouriteMovieState!=current.favouriteMovieState,
      builder: (BuildContext context, state) {
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
                  itemCount: state.favouriteMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movie: state.favouriteMovies[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
