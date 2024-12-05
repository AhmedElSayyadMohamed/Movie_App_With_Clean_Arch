import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/utiles/responsive/responsive.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/general_bloc/general_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/movie_rating_widget/movie_rating_wadgit.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../core/utiles/share_functions.dart';
import '../../../domain/entity/movie.dart';
import '../../controller/watch_later_cubit/watch_later_cubit.dart';
import '../../controller/watch_later_cubit/watch_later_states.dart';
import '../movie_image_item.dart';

class MovieWidget extends StatefulWidget {
  final Movie movie;
  final int index;
  final Function() onTap;

  const MovieWidget({
    super.key,
    required this.index,
    required this.onTap,
    required this.movie,
  });

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late final Animation<double> _animation;

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
    return SizedBox(
      key:Key(widget.movie.id.toString()),
      width: 140,
      child: Stack(
        children: [
          InkWell(
            onTap: widget.onTap,
            child: Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MovieImageItem(
                      image: widget.movie.posterPath!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.movie.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: AppSizeConfig.appRatio * 0.008,
                        ),
                        Text(
                          dateFormatting(widget.movie.releaseDate),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: AppSizeConfig.appRatio * 0.008,
                        ),
                        MovieRatingStar(
                          voteAverage: widget.movie.voteAverage,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 6,
            child: BlocProvider.value(
              value: sl<WatchLaterMoviesCubit>(),
              child: BlocBuilder<WatchLaterMoviesCubit, WatchLaterMoviesStates>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      _animationController.forward().then((value) =>
                          _animationController.reverse());
                      sl<WatchLaterMoviesCubit>().toggleFavourite(widget.movie);

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
                            color: widget.movie.isFavourite
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
