
import 'package:flutter/material.dart';

class LoadingCircleIndicator extends StatelessWidget{
  const LoadingCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 240,
     child: Center(
       child: CircularProgressIndicator(
         color:Colors.deepPurpleAccent ,
           strokeWidth:3,
       ),
     ),
    );
  }
}