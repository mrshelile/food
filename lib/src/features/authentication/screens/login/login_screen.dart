import 'package:flutter/material.dart';
import 'package:foods/src/constants/image_strings.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:foods/src/features/authentication/screens/login/login_header_widget.dart';
import 'package:foods/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // Section one
          loginHeaderWidget(size: size),

          // Start Section 2 --forms
          loginForm(),

          LoginFooterWidget(),
        ]),
      ),
    );
  }
}
