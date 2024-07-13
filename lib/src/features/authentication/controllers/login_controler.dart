import 'package:flutter/material.dart';
import 'package:foods/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser() {
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(
      email.text.trim(),
      password.text.trim(),
    );
  }
}
