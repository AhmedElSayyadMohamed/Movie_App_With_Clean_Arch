import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/popular_and_top_rated_widgets/movie_widget.dart';

class CustomListViewBuilder extends StatelessWidget {
  final List<Movie> moviesList ;
  const CustomListViewBuilder({super.key, required this.moviesList});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 180,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsetsDirectional.only(start: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MovieWidget(
            image: moviesList[index].backdropPath,
          ),
          itemCount: moviesList.length,
        ),
      ),
    );
  }
}
