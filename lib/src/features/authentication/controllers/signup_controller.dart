import 'package:flutter/material.dart';
import 'package:foods/src/features/core/models/user_models.dart';
import 'package:foods/src/repository/authentication_repository/authentication_repository.dart';
import 'package:foods/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final role = "Client".obs;
  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password, String role) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password, role) as String;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }
}
