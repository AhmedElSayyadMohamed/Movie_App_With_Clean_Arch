import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/core/constance/api_constance.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingMovieComponent extends StatelessWidget {

  final String image;
  final String movieName;
  final Function()? onTap;
  const NowPlayingMovieComponent({
    super.key,
    required this.image,
    required this.movieName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Stack(
        children: [
          ShaderMask(
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                const Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 16,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Now Playing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 16),
                  child: Text(
                    movieName,
                    textAlign: TextAlign.center,
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
