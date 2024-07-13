import 'package:flutter/material.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/features/authentication/screens/signup/signup_form_widget.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/widgets/forms/form_header_widget.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(children: [
            FormHeaderWidget(
                crossAxisAlignment: CrossAxisAlignment.start,
                imageheight: 0.3,
                image: "assets/images/6.jpg",
                title: "sign up",
                subTitle:
                    "Hello there, sign up with us to start a journey to with us"),
            SignUpFormWidget(),
            Padding(
              padding: EdgeInsets.all(1),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("OR"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 50,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: OutlinedButton.icon(
                            icon: Image(
                              image: AssetImage("assets/logos/google_logo.png"),
                              width: 20,
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                            ),
                            onPressed: () {},
                            label: Text("Sign in With Google"),
                          ),
                        )),
                    SizedBox(height: 10),
                    TextButton(
                        onPressed: () {},
                        child: Text.rich(TextSpan(
                            text: "Already have an account?",
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                  text: " Sign Up",
                                  style: TextStyle(color: Colors.blue)),
                            ])))
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
