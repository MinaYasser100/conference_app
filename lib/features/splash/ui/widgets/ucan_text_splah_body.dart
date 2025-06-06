import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class UcanTextSplashBody extends StatelessWidget {
  const UcanTextSplashBody({
    super.key,
    required this.slideFromRight,
    required this.textFadeAnimation,
    required this.slideFromLeft,
    required this.finalFadeAnimation,
  });

  final Animation<Offset> slideFromRight;
  final Animation<double> textFadeAnimation;
  final Animation<Offset> slideFromLeft;
  final Animation<double> finalFadeAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // UCAN
        SlideTransition(
          position: slideFromRight,
          child: FadeTransition(
            opacity: textFadeAnimation,
            child: Text(
              'UCAN',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: ColorsTheme().primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // مؤتمر
        SlideTransition(
          position: slideFromLeft,
          child: FadeTransition(
            opacity: textFadeAnimation,
            child: Text(
              'مؤتمر',
              style: AppTextStyles.styleBold30sp(
                context,
              ).copyWith(fontSize: 28, color: ColorsTheme().primaryColor),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // 2025
        FadeTransition(
          opacity: finalFadeAnimation,
          child: Text(
            '2025',
            style: AppTextStyles.styleBold34sp(
              context,
            ).copyWith(color: ColorsTheme().primaryColor),
          ),
        ),
      ],
    );
  }
}
