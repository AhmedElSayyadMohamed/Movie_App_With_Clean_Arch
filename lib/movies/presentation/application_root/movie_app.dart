import 'package:flutter/material.dart';

import '../screens/layout/home_view.dart';

class MovieApp extends StatelessWidget {
   const MovieApp({super.key});

  final ColorScheme colorScheme = const ColorScheme(
    primary: Colors.indigo, // Variant of the primary color
    secondary: Colors.indigo, // Variant of the secondary color
    background: Colors.black87, // Background color
    surface: Colors.black87, // Surface color
    onBackground: Colors.black87, // Color of text on background color
    onSurface: Colors.white, // Color of text on surface color
    onError: Colors.white, // Color of text on error color
    error: Colors.red, // Error color
    brightness: Brightness.dark,
    onPrimary: Colors.indigo,
    onSecondary: Colors.amber, // Brightness of the color scheme
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: colorScheme),
      home: const LayoutView(),
    );
  }
}

