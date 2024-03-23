import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_with_clean_arch/core/utiles/responsive/responsive.dart';
import 'package:movie_app_with_clean_arch/core/utiles/string_manager/string_manager.dart';

class LottieLoadingIndicator extends StatelessWidget {
  const LottieLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizeConfig.height,
        width: AppSizeConfig.width,
        child: Lottie.asset(StringManager.lottieLoading),
    );
  }
}
