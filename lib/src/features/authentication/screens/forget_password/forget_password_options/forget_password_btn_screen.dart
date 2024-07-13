import 'package:flutter/material.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:foods/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen {
  static dynamic buildShowModalBottomSheet(
      BuildContext context) {
    return showBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) => Container(
              height: 400,
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Make a Selection",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "Select one of the option geiven below to reset your password",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ForgetButtonWidget(
                    btnIcon: Iconsax.message4,
                    title: "Email",
                    subTitle: "Reset via Mail verification",
                    onTap: () {
                     Navigator.pop(context);
                      Get.to(() => ForgetPassowrdMailScreen());
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ForgetButtonWidget(
                    btnIcon: Iconsax.call,
                    title: "Phone No",
                    subTitle: "Reset via Phone verification",
                    onTap: () {},
                  )
                ],
              ),
            ));
  }
}
