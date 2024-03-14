import 'package:flutter/material.dart';
import '../../../../core/utiles/share_functions.dart';
import '../popular_movie_item.dart';

class MovieWidget extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final double voteAverage;
  const MovieWidget({
    super.key,
    required this.image,
    required this.title,
    required this.date, required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 4),
      child: SizedBox(
        height: 210,
        width: 140,
        child: Stack(
alignment: AlignmentDirectional.topEnd,
          children: [
            Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PopularMovieItem(
                  image: image,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 20,),
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.008,
                      ),
                      Text(
                        dateFormatting(date),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: (){},
                  child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.grey[500]!.withOpacity(0.7),
                      child: Icon(Icons.more_horiz_rounded,color: Colors.grey[300],)),
              ),
            ),
            PositionedDirectional(
            start: 6,
              top:166 ,
              child: Row(
                children: [
                  const Icon(Icons.star,size: 20,color: Colors.yellow,),
                  Text(voteAverage.toStringAsFixed(1),style: const TextStyle(fontSize: 14),),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
