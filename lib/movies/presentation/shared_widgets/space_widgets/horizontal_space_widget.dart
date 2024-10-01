import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/core/utiles/responsive/responsive.dart';

class HorizontalSpace extends StatelessWidget {
  final int pixels;
  const HorizontalSpace({super.key, required this.pixels,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizeConfig.appRatio * pixels,
    );
  }
}
