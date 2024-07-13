import 'package:flutter/material.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:foods/src/widgets/forms/form_header_widget.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:foods/src/utils/app_colors.dart';

class ForgetPassowrdMailScreen extends StatelessWidget {
  const ForgetPassowrdMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            SizedBox(
              height: tDefaultSize * 2,
            ),
            FormHeaderWidget(
                imageheight: 0.2,
                textAlign: TextAlign.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30,
                image: "assets/images/6.jpg",
                title: "Forget Password",
                subTitle:
                    "Select one of the options given below to reset your password"),
            SizedBox(
              height: 20.0,
            ),
            Form(
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: AppColors.textColor)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      border: InputBorder.none,
                      hintText: "Phone Number",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => OTPScreen());
                  },
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
