import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utiles/share_functions.dart';
import '../movie_rating_widget/movie_rating_wadgit.dart';

class MovieDetailsWidget extends StatelessWidget {

  final String title;
  final String description;
  final String date;
  final double voteAverage;
  const MovieDetailsWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.voteAverage,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsetsDirectional.all(3),
                color: Colors.grey[700],
                child: Text("${dateFormatting(date).split(',').toList()[1]} "),
              ),
              const SizedBox(width: 20),
              MovieRatingStar(
                voteAverage: voteAverage,
              ),
              const SizedBox(width: 20),
              const Text('English'),
              const SizedBox(width: 20),
              IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border))
            ],
          ),
        ),
        Text(
          description,
          style: GoogleFonts.abel(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
