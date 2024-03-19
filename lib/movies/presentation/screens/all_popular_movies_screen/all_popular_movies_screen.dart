import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/states/movie_states.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/movie_image_item.dart';

import '../../../../core/services_locator/services_locator.dart';
import '../../shared_widgets/movie_details_widget/movie_details_widget.dart';
import '../../shared_widgets/movie_details_widgets/movie_details_component.dart';

class AllPopularMoviesScreen extends StatelessWidget {
  const AllPopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        leading: const BackButton(),
      ),
      body: BlocProvider.value(
        value: sl<MoviesBloc>(),
        child: BlocBuilder<MoviesBloc, MoviesStates>(
          builder: (BuildContext context, state) {
            return ListView.builder(
                itemCount: state.popularMovies.length,
                itemBuilder: (context, index) => SizedBox(
                  height: 190,
                  child: Card(
                        shape: const RoundedRectangleBorder(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: MovieImageItem(
                                image: state.popularMovies[index].posterPath!,
                                bottomBorder: 8,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child:Padding(
                                  padding: const EdgeInsetsDirectional.all(10),
                                  child: MovieDetailsWidget(
                                    title:state.popularMovies[index].title,
                                    description:  state.popularMovies[index].overview,
                                    date:state.popularMovies[index].releaseDate,
                                    voteAverage: state.popularMovies[index].voteAverage,
                                  ),
                                ), ),
                          ],
                        ),
                      ),
                ));
          },
        ),
      ),
    );
  }
}
