
import 'package:flutter/material.dart';

class LoadingCircleIndicator extends StatelessWidget{
  const LoadingCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(8),
      height: 240,
     child: const Center(
       child: CircularProgressIndicator(
         color:Colors.deepPurpleAccent ,
           strokeWidth:3,
       ),
     ),
    );
  }
}