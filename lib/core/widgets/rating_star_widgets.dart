// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class RatingStarWidget extends StatelessWidget {
//   final int starsCount;
//   final Function(double) onRatingUpdate;
//   const RatingStarWidget({super.key, required this.starsCount, required this.onRatingUpdate});
//   @override
//   Widget build(BuildContext context) {
//     return RatingBar.builder(
//       initialRating: 0.5,
//       minRating: 0.5,
//       direction: Axis.horizontal,
//       allowHalfRating: true,
//       itemCount: starsCount,
//       itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//       itemBuilder: (context, _) => const Icon(
//         Icons.star,
//         size: 20,
//         color: Colors.amber,
//       ),
//       onRatingUpdate:onRatingUpdate,
//     );
//   }
// }
