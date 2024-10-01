import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_bloc/states/movie_states.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/loading_circle_indicator_widget.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../controller/movie_bloc/events/movies_events.dart';
import '../../shared_widgets/all_movies_card.dart';



class AllPopularMoviesScreen extends StatefulWidget {
  const AllPopularMoviesScreen({super.key});

  @override
  State<AllPopularMoviesScreen> createState() => _AllPopularMoviesScreenState();
}

class _AllPopularMoviesScreenState extends State<AllPopularMoviesScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      sl<MoviesBloc>().add(GetPopularMoviesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
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
              itemCount: state.popularMovies.length + 1,
              itemBuilder: (context, index) {
                if (index < state.popularMovies.length) {
                  return MovieCard(movie: state.popularMovies[index],);
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
