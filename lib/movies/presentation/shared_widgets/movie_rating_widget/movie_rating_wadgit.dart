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
          size: 18,
          color: Colors.amber,
        ),
        const SizedBox(width: 5),
        Text(
          voteAverage.toStringAsFixed(1),
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
