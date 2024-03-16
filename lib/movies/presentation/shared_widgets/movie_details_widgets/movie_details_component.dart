import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/error_message_widget.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/movie_rating_widget/movie_rating_wadgit.dart';
import '../../../../core/utiles/share_functions.dart';

class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      builder: (BuildContext context, state) {
        switch (state.movieDetailState) {
          case RequestState.loading:
            return const LoadingCircleIndicator();
          case RequestState.success:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.movieDetailsModel!.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.all(3),
                        color: Colors.grey[700],
                        child: Text(
                            "${dateFormatting(state.movieDetailsModel!.releaseDate).split(',').toList()[1]} "),
                      ),
                      const SizedBox(width: 10),
                      MovieRatingStar(voteAverage:state.movieDetailsModel!.voteAverage),
                    ],
                  ),
                ),
                Text(state.movieDetailsModel!.description,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        )),
              ],
            );

          case RequestState.error:
            return ErrorMessageWidget(
              message: state.movieDetailsErrorMessage,
            );
        }
      },
    );
  }
}
