import 'package:flutter/material.dart';

import 'ucan_text_splah_body.dart';

class SplashBodyView extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;
  final Animation<double> textFadeAnimation;
  final Animation<Offset> slideFromRight;
  final Animation<Offset> slideFromLeft;
  final Animation<double> finalFadeAnimation;

  const SplashBodyView({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
    required this.textFadeAnimation,
    required this.slideFromRight,
    required this.slideFromLeft,
    required this.finalFadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        const SizedBox.expand(
          child: Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        // Church image and texts
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Church image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: const Image(
                    image: AssetImage('assets/images/church.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Texts with animations
            UcanTextSplashBody(
              slideFromRight: slideFromRight,
              textFadeAnimation: textFadeAnimation,
              slideFromLeft: slideFromLeft,
              finalFadeAnimation: finalFadeAnimation,
            ),
          ],
        ),
      ],
    );
  }
}
