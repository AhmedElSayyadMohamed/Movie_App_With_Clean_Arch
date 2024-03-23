import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/core/constance/api_constance.dart';
import 'package:shimmer/shimmer.dart';

class MovieImageItem extends StatelessWidget{
  final String image;
  final double bottomBorder ;
  const MovieImageItem({super.key, required this.image, this.bottomBorder = 0,});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadiusDirectional.only(
          topStart: const Radius.circular(8),
        topEnd: const Radius.circular(8),
        bottomEnd:Radius.circular(bottomBorder),
        bottomStart:  Radius.circular(bottomBorder),
      ),
      child: CachedNetworkImage(
        width: 140,
        fit: BoxFit.cover,
        imageUrl: ApiConstance.imageUrl(image),
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
        errorWidget: (context, url, error) =>Image.network('https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',fit: BoxFit.cover,),
      ),
    );
  }
}