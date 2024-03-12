import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/home_view/home_view.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/screens/test_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieApp',
      theme:ThemeData.dark(),
      home: const MovieView(),
    );
  }
}

