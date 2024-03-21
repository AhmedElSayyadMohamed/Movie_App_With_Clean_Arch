import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/movie_details/movie_details.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import '../../../../core/constance/request_enum.dart';
import '../error_message_widget.dart';
import '../movie_image_item.dart';

class RecommendationMoviesComponents extends StatelessWidget {
  const RecommendationMoviesComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      buildWhen: (prev, current) =>
          prev.recommendationsMoviesState != current.recommendationsMoviesState,
      builder: (BuildContext context, MovieDetailsStates state) {
        switch (state.recommendationsMoviesState) {
          case RequestState.loading:
            return const LoadingCircleIndicator();
          case RequestState.success:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.recommendationsMovies.isEmpty?
                const SizedBox.shrink()
                    :const Padding(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 20.0),
                  child: Text(
                    'MORE LIKE THIS',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 160,
                    ),
                    itemCount: state.recommendationsMovies.length,
                    itemBuilder: (context, index) {
                      
                      return InkWell(
                        onTap: (){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context)=>MovieDetailsScreen(movie: state.recommendationsMovies[index]),
                              ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.deepPurpleAccent,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: MovieImageItem(
                            image: state
                                .recommendationsMovies[index].posterPath!,
                          ),
                        ),
                      );
                    })
              ],
            );
          case RequestState.error:
            return ErrorMessageWidget(
              message: state.recommendationsMoviesErrorMessage,
            );
        }
      },
    );
  }
}
