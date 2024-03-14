import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/core/constance/api_constance.dart';
import 'package:shimmer/shimmer.dart';

class ImageWithShader extends StatelessWidget {
  final String image;
  const ImageWithShader({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return  ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin:Alignment.topCenter ,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0, 0.3, 0.5, 1],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height),);
      },
      blendMode: BlendMode.dstIn,
      child: CachedNetworkImage(
        height: 400,
        fit: BoxFit.cover,
        imageUrl: ApiConstance.imageUrl(image),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        errorWidget: (context, url, error) =>
        const Icon(Icons.error),
      ),
    );
  }
}
