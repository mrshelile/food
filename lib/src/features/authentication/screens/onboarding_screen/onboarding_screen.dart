import 'package:flutter/material.dart';
import 'package:foods/src/constants/image_strings.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/constants/text_strings.dart';
import 'package:foods/src/features/authentication/controllers/onboarding_controller.dart';
import 'package:foods/src/features/authentication/models/model_on_boarding.dart';
import 'package:foods/src/features/authentication/screens/onboarding_screen/onboarding_widgets_pages.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnboardingController();

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        LiquidSwipe(
          pages: obController.pages,
          liquidController: obController.controller,
          onPageChangeCallback: obController.onPageChangedCallback,
          slideIconWidget: const Icon(Icons.arrow_back_ios),
          enableSideReveal: true,
        ),
        Positioned(
          top: 50,
          right: 20,
          child: TextButton(
            onPressed: () => obController.skip(),
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Obx(
          () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: obController.currentPage.value,
                count: 3,
                effect: WormEffect(
                  activeDotColor: AppColors.iconColor1,
                  dotHeight: 5.0,
                ),
              )),
        ),
      ]),
    );
  }
}
