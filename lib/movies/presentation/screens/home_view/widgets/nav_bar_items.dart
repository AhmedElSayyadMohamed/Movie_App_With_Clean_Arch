import 'package:flutter/material.dart';


List<BottomNavigationBarItem> items =
const [
  BottomNavigationBarItem(
    icon: Icon(Icons.movie_outlined),
    activeIcon: Icon(Icons.movie),
    label: 'Movies',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.home_max),
    activeIcon: Icon(Icons.home_max_outlined),
    label: 'Watch',
  ),
];