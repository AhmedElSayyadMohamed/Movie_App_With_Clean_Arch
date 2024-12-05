import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/genres.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/error_message_widget.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import '../../../domain/entity/movie.dart';
import '../movie_details_widget/movie_details_widget.dart';

class MovieDetailsComponent extends StatelessWidget {
  final Movie movie;
  const MovieDetailsComponent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      buildWhen: (prev,current)=> prev.movieDetailState != current.movieDetailState,
      builder: (BuildContext context, state) {
        switch (state.movieDetailState) {
          case RequestState.loading:
            return const LoadingCircleIndicator();
          case RequestState.success:
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailsWidget(
                    movie: movie,
                  ),
                  const SizedBox(
                      height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Genres : ',
                        style: GoogleFonts.abel(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          children: state.movieDetailsModel!.genres
                              .map(
                                (e) => Text(
                                  '${e.name}, ',
                                  style: GoogleFonts.abel(
                                    fontSize: 16,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
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

  String formattingGenres(List<Genres> generes) {
    String generes0 = '';
    for (var element in generes) {
      generes0 += element.name;
    }
    return generes0;
  }
}
