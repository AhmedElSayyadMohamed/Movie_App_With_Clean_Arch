import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/states/movie_states.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../controller/movie_bloc/events/movies_events.dart';
import '../../shared_widgets/all_movies_card.dart';


class AllTopRatedMoviesScreen extends StatefulWidget {
  const AllTopRatedMoviesScreen({super.key});

  @override
  State<AllTopRatedMoviesScreen> createState() => _AllTopRatedMoviesScreenState();
}

class _AllTopRatedMoviesScreenState extends State<AllTopRatedMoviesScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      sl<MoviesBloc>().add(GetTopRatedMoviesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopRated Movies'),
        leading: const BackButton(),
      ),
      body: BlocProvider.value(
        value: sl<MoviesBloc>(),
        child: BlocBuilder<MoviesBloc, MoviesStates>(
            builder: (BuildContext context, state) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 20,
                  start: 10,
                  end: 10,
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  itemCount: state.topRatedMovies.length + 1,
                  itemBuilder: (context, index) {
                    if (index < state.topRatedMovies.length) {
                      return MovieCard(movie: state.topRatedMovies[index],);
                    } else {
                      return const LoadingCircleIndicator(
                        height: 50,
                      );
                    }
                  },
                ),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }
}
