import 'package:flutter/material.dart';
import 'package:foods/src/constants/image_strings.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/constants/text_strings.dart';
import 'package:foods/src/widgets/fade_in_animation/fade_animation_controller.dart';
import 'package:foods/src/widgets/fade_in_animation/fade_animations_model.dart';
import 'package:foods/src/widgets/fade_in_animation/animation_designs.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/widgets/circular_shape.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1600,
            animate: TAnimatePosition(
              topBefore: -30.0,
              leftBefore: -30.0,
              topAfter: 0.0,
              leftAfter: 0.0,
            ),
            child: CircularShapeWidget(
              diameter: 100.0,
              color: Colors.blue,
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2000,
            animate: TAnimatePosition(
                topBefore: 80,
                topAfter: 80,
                leftAfter: tDefaultSize,
                leftBefore: -80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tAppName,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  tAppTagLine,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2000,
            animate: TAnimatePosition(
                topBefore: 80,
                topAfter: 80,
                leftAfter: tDefaultSize,
                leftBefore: -80),
            child: Image.asset(tSplashImage),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animate: TAnimatePosition(
                bottomBefore: 0,
                bottomAfter: 60,
                rightBefore: tDefaultSize,
                rightAfter: tDefaultSize),
            child: Container(
              width: tDefaultSize,
              height: tSplashContainerSize,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
