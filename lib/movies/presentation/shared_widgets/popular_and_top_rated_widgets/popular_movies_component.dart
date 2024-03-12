import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/states/movie_states.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/popular_and_top_rated_widgets/movie_widget.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current)=> previous.popularMovieState!=current.popularMovieState,
      builder: (BuildContext context, state) {
        // return Text(state.popularMovies.length.toString());

        switch(state.popularMovieState){
          case RequestState.loading: return const SizedBox(
            height: 170,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
          case RequestState.success: return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsetsDirectional.only(start: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MovieWidget(
                  image: state.popularMovies[index].backdropPath,
                ),
                itemCount:state.popularMovies.length,
              ),
            ),
          );
          case RequestState.error: return  SizedBox(
            height: 360,
            child: Center(
              child: Text(state.popularErrorMessage),
            ),
          );
        }

      },
    );
  }
}
