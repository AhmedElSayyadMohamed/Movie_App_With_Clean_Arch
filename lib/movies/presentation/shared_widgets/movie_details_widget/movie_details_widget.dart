import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/general_bloc/general_bloc.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../core/utiles/share_functions.dart';
import '../../../domain/entity/movie.dart';
import '../../controller/watch_later_cubit/watch_later_cubit.dart';
import '../../controller/watch_later_cubit/watch_later_states.dart';
import '../movie_rating_widget/movie_rating_wadgit.dart';

class MovieDetailsWidget extends StatefulWidget {
  final Movie movie;
  const MovieDetailsWidget({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late final Animation<double> _animation ;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.movie.title,
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
                child: Text("${dateFormatting(widget.movie.releaseDate).split(',').toList()[1]} "),
              ),
              const SizedBox(width: 20),
              MovieRatingStar(
                voteAverage: widget.movie.voteAverage,
              ),
              const SizedBox(width: 20),
              Text(widget.movie.language),
              const SizedBox(width: 20),
              BlocProvider.value(
                value: sl<WatchLaterMoviesCubit>(),
                child: BlocBuilder<WatchLaterMoviesCubit,WatchLaterMoviesStates>(
                  builder: (BuildContext context,state) {
                    return  InkWell(
                      onTap: () {
                        _animationController.forward().then((value) =>_animationController.reverse());
                        sl<WatchLaterMoviesCubit>().toggleFavourite(widget.movie);
                        // BlocProvider.of<GeneralBloc>(context).add(ToggleFavouriteEvent(widget.movie));
                      },
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (BuildContext context, Widget? child) {
                          return CircleAvatar(
                            radius: 15 * _animation.value,
                            backgroundColor: Colors.grey[500]!.withOpacity(0.2),
                            child: Icon(
                              widget.movie.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 24 * _animation.value,
                              color:  widget.movie.isFavourite
                                  ? Colors.redAccent
                                  : Colors.grey[300],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Text(
          widget.movie.overview,
          style: GoogleFonts.abel(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
