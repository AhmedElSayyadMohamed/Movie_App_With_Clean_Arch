import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';
import 'actor_card.dart';

class MovieCastComponent extends StatelessWidget {
  const MovieCastComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      buildWhen: (prev, current) =>
          prev.castActorsState != current.castActorsState,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state.castActors.isEmpty
                  ? const SizedBox.shrink()
                  : Text(
                      'Cast : ',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 18),
                    ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsetsDirectional.all(3),
                  itemCount: state.castActors.length,
                  itemBuilder: (context, index) => ActorCard(
                    actor: state.castActors[index],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
