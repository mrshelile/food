import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foods/src/features/authentication/controllers/signup_controller.dart';
import 'package:foods/src/features/core/models/restraurant_info_model.dart';
import 'package:foods/src/features/core/models/user_models.dart';
import 'package:foods/src/features/core/screens/dashboard/restruarant/pages/menu_screen.dart';
import 'package:foods/src/features/core/screens/dashboard/restruarant/restraurant_info.dart';
import 'package:foods/src/repository/authentication_repository/exceptions/signup_email_password_failer.dart';
import 'package:foods/src/features/authentication/screens/login/login_screen.dart';
import 'package:foods/src/features/authentication/screens/welcome/welcome_page.dart';
import 'package:foods/src/features/core/screens/dashboard/admin/admin_dashboard.dart';
import 'package:foods/src/features/core/screens/dashboard/client/client_dashboard.dart';
import 'package:foods/src/features/core/screens/dashboard/restruarant/restraurant_dashboard.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final controller = Get.put(SignUpController());
  late final user = UserModel(
      fullName: controller.fullName.text.trim(),
      email: controller.email.text.trim(),
      phoneNo: controller.phoneNo.text.trim(),
      role: controller.role.toString());

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) async {
    route2(myUser: user);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String role) async {
    try {
      late UserCredential userCredential1;

      final userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        userCredential1 = value;
        // return {controller.createUser(user)};
        await controller.createUser(user);
      });

      if (firebaseUser.value != null && role == "Restraurant") {
        // Navigate to Restaurant Dashboard directly
        Get.offAll(() => RestaurantInfo(
              user: userCredential1,
            ));
      } else {
        // Navigate to LoginScreen or WelcomePage based on other logic
        Get.offAll(() => LoginScreen()); // Replace with WelcomePage if needed
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailer.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailer();
      print('EXCEPTION -${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await route2();
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailer.code(e.code);
    } catch (_) {
      throw SignUpWithEmailAndPasswordFailer();
    }
  }

  Future<void> route2({User? myUser}) async {
    final users = await FirebaseFirestore.instance.collection('Users').get();
    for (var element in users.docs) {
      // print(element.data()['role']);
      // print(element.data()['Email']);
      // print(user.email);
      if (element.data()['Email'] ==
          (myUser == null ? user.email : myUser.email)) {
        switch (element.data()['role']) {
          case "Client":
            Get.to(() => ClientDashBoard());
            break;
          case "Admin":
            Get.to(() => AdminDashboard());
            break;
          case "Restraurant":
            Get.to(() => AddFoodPage());
            break;
          default:
        }
      }
    }
  }

  // Future<void> route() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   var kk = FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(user!.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     print(documentSnapshot.id);
  //     if (documentSnapshot.exists) {
  //       if (documentSnapshot.get('role') == "Client") {
  //         Get.to(() => ClientDashBoard());
  //       }
  //       if (documentSnapshot.get('role') == "Restraurant") {
  //         print(user.uid);
  //         Get.to(() => RestraurantDashBoard());
  //       }
  //       if (documentSnapshot.get('role') == "Admin") {
  //         Get.to(() => AdminDashboard());
  //       }
  //     } else {
  //       //print(user.uid);
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.to(() => WelcomePage());
    } catch (e) {
      print("Error signing out: $e");
      // Show error message to the user
    }
  }
}
