import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/space_widgets/horizontal_space_widget.dart';
import '../../../core/services_locator/services_locator.dart';
import '../../../core/utiles/share_functions.dart';
import '../../domain/entity/movie.dart';
import '../controller/movie_bloc/bloc/movies_bloc.dart';
import '../controller/movie_bloc/events/movies_events.dart';
import '../controller/movie_bloc/states/movie_states.dart';
import '../screens/movie_details/movie_details.dart';
import 'movie_image_item.dart';
import 'movie_rating_widget/movie_rating_wadgit.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late final Animation<double> animation ;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
     animation = Tween<double>(
    begin: 1.0,
    end: 1.5,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: ()=> goToMovieDetails,
            child: Container(
              height: 170,
              padding: const EdgeInsetsDirectional.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: MovieImageItem(
                      image: widget.movie.posterPath!,
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
                                  widget.movie.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child:SizedBox(
                                      child: InkWell(
                                        onTap: () {
                                          _animationController.forward().then((value) =>_animationController.reverse());
                                          sl<MoviesBloc>().add(AddToFavouriteEvent(widget.movie));
                                        },
                                        child: AnimatedBuilder(
                                          animation: animation,
                                          builder: (BuildContext context, Widget? child) {
                                            return CircleAvatar(
                                              radius: 15 * animation.value,
                                              backgroundColor: Colors.grey[500]!.withOpacity(0.2),
                                              child: Icon(
                                                widget.movie.isFavourite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                size: 24 * animation.value,
                                                color:  widget.movie.isFavourite
                                                    ? Colors.redAccent
                                                    : Colors.grey[300],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 11.0,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsetsDirectional.all(
                                    3,
                                  ),
                                  color: Colors.red[400],
                                  child: Text(
                                      "${dateFormatting(widget.movie.releaseDate).split(',').toList()[1]} "),
                                ),
                                const HorizontalSpace(pixels: 15),
                                MovieRatingStar(
                                  voteAverage: widget.movie.voteAverage,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.movie.overview,
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


  get goToMovieDetails{
    navigatePushTo(
      MovieDetailsScreen(
        movie: widget.movie,
      ),
      context,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
