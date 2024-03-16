import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/popular_and_top_rated_widgets/movie_widget.dart';

import '../../../../core/utiles/share_functions.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/states/movie_states.dart';
import '../../screens/movie_details/movie_details.dart';
import '../error_message_widget.dart';
import '../loading_circle_indicator_widget.dart';

class TopRatedMoviesComponent extends StatelessWidget {
  const TopRatedMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current)=>previous.topRatedMovieState!=current.topRatedMovieState,
      builder: (BuildContext context, state) {
        switch(state.topRatedMovieState){
          case RequestState.loading: return const LoadingCircleIndicator();
          case RequestState.success: return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 220,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsetsDirectional.only(start: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MovieWidget(
                  image:state.topRatedMovies[index].posterPath!,
                  title: state.topRatedMovies[index].title,
                  date: state.topRatedMovies[index].releaseDate,
                  voteAverage:  state.topRatedMovies[index].voteAverage,
                  onTap: () {navigatePushTo(MovieDetailsScreen( movie: state.topRatedMovies[index]),context); },
                ),
                itemCount: state.topRatedMovies.length,
              ),
            ),
          );
          case RequestState.error: return ErrorMessageWidget(message:state.topRatedErrorMessage,);
        }

      },
    );
  }
}
