import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/states/movie_states.dart';
import '../../shared_widgets/all_movies_card.dart';
import '../../shared_widgets/loading_circle_indicator_widget.dart';

class WatchLaterScreen extends StatelessWidget {
  const WatchLaterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
            builder: (BuildContext context, state) {
              var bloc =BlocProvider.of<MoviesBloc>(context);
              return Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 20,
                  start: 10,
                  end: 10,
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: bloc.favouriteMovies.length ,
                  itemBuilder: (context, index) {
                    if (index < state.popularMovies.length) {
                      return MovieCard(movie:bloc.favouriteMovies[index],);
                    } else {
                      return const LoadingCircleIndicator(
                        height: 50,
                      );
                    }
                  },
                ),
              );
            });

  }

}
