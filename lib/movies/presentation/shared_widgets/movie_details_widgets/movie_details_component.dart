import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/genres.dart';
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
      buildWhen: (prev,current)=> prev.movieDetailState != current.movieDetailState,
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
                        const SizedBox(width: 20),
                        MovieRatingStar(
                            voteAverage: state.movieDetailsModel!.voteAverage,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          timeFormatting(
                            state.movieDetailsModel!.runtimeInSecond,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    state.movieDetailsModel!.description,
                    style: GoogleFonts.abel(
                      fontSize: 18,
                    ),
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
                ]);

          case RequestState.error:
            return ErrorMessageWidget(
              message: state.movieDetailsErrorMessage,
            );
        }
      },
    );
  }

  String formattingGenres(List<Genres> generes) {
    String _generes = '';
    generes.forEach((element) {
      print(element.name);
      _generes += element.name;
    });
    return _generes;
  }
}
