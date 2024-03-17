import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/movie_details/movie_details.dart';
import '../../../../core/utiles/share_functions.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/states/movie_states.dart';
import '../error_message_widget.dart';
import '../loading_circle_indicator_widget.dart';
import 'movie_widget.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current)=> previous.popularMovieState!=current.popularMovieState,
      builder: (BuildContext context, state) {
        switch(state.popularMovieState){
          case RequestState.loading: return const LoadingCircleIndicator();
          case RequestState.success: return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsetsDirectional.only(start: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MovieWidget(
                  image: state.popularMovies[index].posterPath!,
                  title: state.popularMovies[index].title,
                  date: state.popularMovies[index].releaseDate,
                  voteAverage: state.popularMovies[index].voteAverage,
                  onTap: () {navigatePushTo(MovieDetailsScreen( movie: state.popularMovies[index]),context);  },
                ),
                itemCount:state.popularMovies.length,
              ),
            ),
          );
          case RequestState.error: return ErrorMessageWidget(message:state.popularErrorMessage);
        }

      },
    );
  }
}
