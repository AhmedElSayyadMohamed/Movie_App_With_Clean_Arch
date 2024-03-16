import 'package:flutter/material.dart';

class MovieRatingStar extends StatelessWidget {
  const MovieRatingStar({
    super.key,
    required this.voteAverage,
  });

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 20,
          color: Colors.amber,
        ),
        Text(
          voteAverage.toStringAsFixed(1),
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
