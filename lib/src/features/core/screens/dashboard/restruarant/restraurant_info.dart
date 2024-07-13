import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:foods/src/features/core/controllers/restaurant_register_controller.dart';
import 'package:foods/src/features/core/models/restraurant_info_model.dart';
import 'package:foods/src/features/core/screens/dashboard/restruarant/pages/menu_screen.dart';
import 'package:foods/src/features/core/screens/dashboard/restruarant/restraurant_dashboard.dart';
import 'package:foods/src/repository/authentication_repository/authentication_repository.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/widgets/big_text.dart';
import 'package:foods/src/widgets/small_text.dart';
import 'package:get/get.dart';

class RestaurantInfo extends StatefulWidget {
  final UserCredential? user;
  const RestaurantInfo({super.key, this.user});

  @override
  State<RestaurantInfo> createState() => _RestaurantInfoState();
}

class _RestaurantInfoState extends State<RestaurantInfo> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(RestaurantController());
  TimeOfDay openingTime = TimeOfDay.now();
  TimeOfDay closingTime = TimeOfDay.now();
  String closing = "Closing Hours";
  String opening = "Opening Hours";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.android,
                  size: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                BigText(text: "Hello There"),
                SizedBox(
                  height: 10,
                ),
                SmallText(text: "Register your Restaurant Details Below"),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Restaurant Name",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.description,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Description",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.address,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Address",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.phoneNumber,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Contact Number",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.openingTime,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: opening,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                    onTap: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: openingTime,
                          initialEntryMode: TimePickerEntryMode.dial);
                      if (timeOfDay != null) {
                        setState(() {
                          openingTime = timeOfDay;
                          opening = "${openingTime.hour}:${openingTime.minute}";
                          opening.toString();
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.closingTime,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: closing,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                    onTap: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: closingTime,
                          initialEntryMode: TimePickerEntryMode.dial);
                      if (timeOfDay != null) {
                        setState(() {
                          closingTime = timeOfDay;
                          closing = "${closingTime.hour}:${closingTime.minute}";
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: controller.deliveryAreasText,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Delivery Areas (comma separated)",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () async {
                      final name = controller.name.text.trim();
                      final description = controller.description.text
                          .trim(); // Assuming a description field
                      final address = controller.address.text.trim();
                      final phoneNumber = controller.phoneNumber.text.trim();
                      final openingTime = controller
                          .openingTime; // Assuming TimeOfDay object is obtained
                      final closingTime = controller
                          .closingTime; // Assuming TimeOfDay object is obtained
                      final deliveryAreas = controller.deliveryAreasText.text
                          .trim()
                          .split(',')
                          .map((area) => area.trim())
                          .toList();

                      try {
                        // Attempt restaurant registration
                        await Get.find<RestaurantController>()
                            .registerAndUploadRestaurantInfo(
                          widget.user,
                          name,
                          description,
                          address,
                          phoneNumber,
                          openingTime.toString(),
                          closingTime.toString(),
                          deliveryAreas as List<String>,
                        );

                        // Handle successful registration (e.g., navigate to dashboard)
                        Get.snackbar(
                          "Success!",
                          "Restaurant registration successful!",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green.withOpacity(0.1),
                          colorText: Colors.green,
                        );
                        Get.offAll(() => AddFoodPage());
                      } on Exception catch (e) {
                        // Handle registration error
                        Get.snackbar(
                          "Error",
                          "Registration failed: ${e.toString()}",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.redAccent.withOpacity(0.1),
                          colorText: Colors.red,
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      // width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ])),
                      child: Center(
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
