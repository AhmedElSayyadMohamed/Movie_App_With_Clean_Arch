import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/movies/data/data_source/local/hive_database.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/general_bloc/general_bloc.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../core/utiles/string_manager/string_manager.dart';
import '../../shared_widgets/all_movies_card.dart';

class WatchLaterScreen extends StatelessWidget {
  const WatchLaterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GeneralBloc, GeneralState>(
      builder: (BuildContext context, state) {
        var bloc = GeneralBloc.get(context);
       // var list =  sl<HiveDataBase>().getFavouriteBox(boxKey: 'favouriteMovies');
       //  print(list);
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 20,
            start: 10,
            end: 10,
          ),
          child: Column(
            children: [
              Text(
                StringManager.watchList,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: bloc.favouriteMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movie: bloc.favouriteMovies[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
