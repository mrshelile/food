
import 'package:foods/src/features/authentication/screens/welcome/welcome_page.dart';
import 'package:get/get.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;

    await Future.delayed(Duration(milliseconds: 3000));
    animate.value = false;

    await Future.delayed(Duration(milliseconds: 5000));
    Get.offAll(() => WelcomePage());
  }


    Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
 
  
  }
}
