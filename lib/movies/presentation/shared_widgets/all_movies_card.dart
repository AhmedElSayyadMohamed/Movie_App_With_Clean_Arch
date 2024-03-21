import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utiles/share_functions.dart';
import '../../domain/entity/movie.dart';
import '../screens/movie_details/movie_details.dart';
import 'movie_image_item.dart';
import 'movie_rating_widget/movie_rating_wadgit.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    this.onTapAddToWatch,
  });
  final Movie movie;
  final void Function()? onTapAddToWatch;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          navigatePushTo(
            MovieDetailsScreen(
              movie: movie,
            ),
            context,
          );
        },
        child: Container(
          height: 170,
          padding: const EdgeInsetsDirectional.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: MovieImageItem(
                  image: movie.posterPath!,
                  bottomBorder: 8,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                movie.title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: onTapAddToWatch,
                                icon: const Icon(
                                  Icons.home_max_outlined,
                                ),
                              ),
                            )
                          ]),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsetsDirectional.all(
                                3,
                              ),
                              color: Colors.red[400],
                              child: Text(
                                  "${dateFormatting(movie.releaseDate).split(',').toList()[1]} "),
                            ),
                            const SizedBox(width: 10),
                            MovieRatingStar(
                              voteAverage: movie.voteAverage,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          movie.overview,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: GoogleFonts.abel(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
