import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/core/constance/api_constance.dart';
import 'package:shimmer/shimmer.dart';

class MovieWidget extends StatelessWidget {
  final String image;
  const MovieWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          width: 115,
          fit: BoxFit.cover,
          imageUrl:ApiConstance.imageUrl(image) ,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              height: 170.0,
              width: 120.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
