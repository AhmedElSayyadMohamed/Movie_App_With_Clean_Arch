import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean_arch/movies/domain/entity/movie_details.dart';
import '../../../../core/utiles/share_functions.dart';
import '../../controller/movie_bloc/bloc/movies_bloc.dart';
import '../../controller/movie_bloc/events/movies_events.dart';
import '../movie_rating_widget/movie_rating_wadgit.dart';

class MovieDetailsWidget extends StatefulWidget {
  final MovieDetails movie;
  const MovieDetailsWidget({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget>  with SingleTickerProviderStateMixin {

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
              InkWell(
                onTap: () {
                  _animationController.forward().then((value) =>_animationController.reverse());
                  BlocProvider.of<MoviesBloc>(context).add(ToggleFavouriteEvent(movieDetails: widget.movie));
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
              ),
            ],
          ),
        ),
        Text(
          widget.description,
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
