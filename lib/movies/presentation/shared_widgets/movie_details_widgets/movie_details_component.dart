
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';

class MovieDetailsComponent extends StatelessWidget{
  const MovieDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieDetailsBloc,MovieDetailsStates>(

      builder: (BuildContext context, state) {
        print(state.movieDetailsModel);
        return Column(
          children: [

          ],
        );
      },
    );
  }
}