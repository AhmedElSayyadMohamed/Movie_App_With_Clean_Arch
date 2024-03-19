import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/shared_widgets/movie_rating_widget/movie_rating_wadgit.dart';
import '../../../../core/utiles/share_functions.dart';
import '../movie_image_item.dart';

class MovieWidget extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final double voteAverage;
  final Function() onTap;

  const MovieWidget({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.voteAverage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 140,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MovieImageItem(
                      image: image,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.008,
                        ),
                        MovieRatingStar(voteAverage: voteAverage),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.grey[500]!.withOpacity(0.7),
                  child: Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
