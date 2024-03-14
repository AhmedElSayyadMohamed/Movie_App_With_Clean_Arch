import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/movie_details_widgets/movie_trial_widget.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../shared_widgets/movie_details_widgets/movie_details_component.dart';
import '../../shared_widgets/movie_details_widgets/recommendation_movies_components.dart';

class MovieDetailsScreen extends StatelessWidget {

  const MovieDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
        create: (BuildContext context)=>sl<MovieDetailsBloc>(),
        child:  const Scaffold(
          body: Column(
            children:[
              MovieTrialWidget(),
              MovieDetailsComponent(),
              RecommendationMoviesComponents(),
            ],
          ),
        ),

    );
  }


}




