import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_arch/core/utiles/responsive/responsive.dart';

class VerticalSpace extends StatelessWidget {
  final int pixels;
  const VerticalSpace({super.key, required this.pixels,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeConfig.appRatio * pixels,
    );
  }
}
