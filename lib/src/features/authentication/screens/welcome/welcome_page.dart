import 'package:flutter/material.dart';
import 'package:foods/src/constants/image_strings.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/constants/text_strings.dart';
import 'package:foods/src/features/authentication/screens/login/login_screen.dart';
import 'package:foods/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/widgets/fade_in_animation/animation_designs.dart';
import 'package:foods/src/widgets/fade_in_animation/fade_animation_controller.dart';
import 'package:foods/src/widgets/fade_in_animation/fade_animations_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = MediaQuery.of(context).size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.secondaryColor : AppColors.primaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animate: TAnimatePosition(
              topBefore: 0,
              bottomBefore: -100,
              leftBefore: 0,
              rightBefore: 0,
              topAfter: 0,
              bottomAfter: 0,
              leftAfter: 0,
              rightAfter: 0,
            ),
            child: Container(
                padding: EdgeInsets.all(tDefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: const AssetImage(tWelcomeScreenImage),
                      height: height * 0.6,
                    ),
                    Column(
                      children: [
                        Text(tWelcomeTitle,
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text(
                          tWelcomeSubTitle,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () => Get.to(() => LoginScreen()),
                              child: Text(
                                tLogin.toUpperCase(),
                              )),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () => Get.to(() => SignUpScreen()),
                              child: Text(
                                tSignup.toUpperCase(),
                              )),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
