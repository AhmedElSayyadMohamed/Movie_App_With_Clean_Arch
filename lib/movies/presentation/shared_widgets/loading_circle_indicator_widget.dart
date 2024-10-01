
import 'package:flutter/material.dart';

class LoadingCircleIndicator extends StatelessWidget{
  final double height;
  const LoadingCircleIndicator({super.key,this.height =250});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(8),
      height: height,
     child: const Center(
       child: CircularProgressIndicator(
         color:Colors.deepPurpleAccent ,
           strokeWidth:3,
       ),
     ),
    );
  }
}