import 'package:foods/src/constants/image_strings.dart';
import 'package:foods/src/constants/text_strings.dart';
import 'package:foods/src/features/authentication/models/model_on_boarding.dart';
import 'package:foods/src/features/authentication/screens/onboarding_screen/onboarding_widgets_pages.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingpages(
        model: OnBoardingModel(
            image: tOnBoardingImage1,
            title: tOnBoardingTittle1,
            subTitle: tOnBoardingSubTittle1,
            counterText: tOnBoardingCounter1,
            bgColor: AppColors.tOnBoardingPage1Color)),
    OnBoardingpages(
        model: OnBoardingModel(
            image: tOnBoardingImage2,
            title: tOnBoardingTittle2,
            subTitle: tOnBoardingSubTittle2,
            counterText: tOnBoardingCounter2,
            bgColor: AppColors.tOnBoardingPage2Color)),
    OnBoardingpages(
        model: OnBoardingModel(
            image: tOnBoardingImage3,
            title: tOnBoardingTittle3,
            subTitle: tOnBoardingSubTittle3,
            counterText: tOnBoardingCounter3,
            bgColor: AppColors.tOnBoardingPage3Color)),
  ];



  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  onPageChangedCallback(int activePageIndex) =>currentPage.value = activePageIndex;
}
