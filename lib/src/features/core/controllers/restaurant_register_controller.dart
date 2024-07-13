import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:foods/src/features/core/models/restraurant_info_model.dart';
import 'package:get/get.dart'; // Assuming your RestaurantModel is here

class RestaurantController extends GetxController {
  static RestaurantController get instance => Get.find();
  // Single controller for comma-separated delivery areas

  final _firestore = FirebaseFirestore.instance;

  // Text Editing Controllers for user input
  final name = TextEditingController();
  final description = TextEditingController();
  final address = TextEditingController();
  final phoneNumber = TextEditingController();

  final openingTime =
      TextEditingController(); // Observable list for opening hours (needs implementation)
  final closingTime = TextEditingController();

  final deliveryAreasText = TextEditingController();
  Future<void> registerAndUploadRestaurantInfo(
    final UserCredential? user,
    String name,
    String description,
    String address,
    String phoneNumber,
    String openingTime,
    String closingTime,
    List<String> deliveryAreas,
  ) async {
    if (user == null) {
      throw Exception('Failed to create user');
    }

    // Access the user ID from the UserCredential object
    final String userId = user.user!.uid;

    // Prepare restaurant data using the model
    final restaurant = RestaurantModel.create(
      User: user, // Keep this for potential future use within the model
      name: name,
      description: description,
      address: address,
      phoneNumber: phoneNumber,
      openingTime: openingTime,
      closingTime: closingTime,
      deliveryAreas: deliveryAreas,
    );

    // Use the user ID to create a specific document reference
    final docRef = _firestore.collection('restaurants').doc(userId);

    // Upload restaurant data to Firestore with the user ID as the document ID
    await docRef.set(restaurant.toJson());
  }

  Future<RestaurantModel> getResDetails(String email) async {
    final snapshot = await _firestore
        .collection('restaurants')
        .where("user", isEqualTo: email)
        .get();
    final resData =
        snapshot.docs.map((e) => RestaurantModel.fromSnapshot(e)).single;
    return resData;
  }

  Future<List<RestaurantModel>> allRes() async {
    final snapshot = await _firestore.collection("restaurants").get();

    final resData =
        snapshot.docs.map((e) => RestaurantModel.fromSnapshot(e)).toList();

    return resData;
  }
}
