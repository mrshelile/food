import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  final UserCredential? user;
  final String? id; // Optional for new restaurants, filled later
  String? name; // Now optional
  String? description; // Now optional
  String? address; // Now optional
  String? phoneNumber; // Now optional
  // Opening Hours
  String openingTime;
  String closingTime;
  // Delivery Areas
  final List<String> deliveryAreas; // Still required

  RestaurantModel({
    this.user,
    this.id,
    this.name,
    this.description,
    this.address,
    this.phoneNumber,
    required this.openingTime,
    required this.closingTime,
    required this.deliveryAreas,
  });
  factory RestaurantModel.create({
    required User,
    required String name,
    String? description,
    String? address,
    String? phoneNumber,
    String? category,
    String? imageUrl,
    double? avgRating,
    String? openingTime,
    String? closingTime,
    required List<String> deliveryAreas,
  }) {
    // Validate required fields here (optional)
    return RestaurantModel(
      user: User,
      name: name,
      description: description,
      address: address,
      phoneNumber: phoneNumber,
      openingTime: openingTime!,
      closingTime: closingTime!,
      deliveryAreas: deliveryAreas,
    );
  }

  toJson() {
    return {
      "id": id,
      "user": user!.user!.email,
      "name": name,
      "description": description,
      "address": address,
      "phoneNumber": phoneNumber,
      "openingTime": openingTime,
      "closingTime": closingTime,
      "deliveryAreas": deliveryAreas,
    };
  }

  //fetch some of the restaurant data
  factory RestaurantModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RestaurantModel(
      user: data[User],
      name: data['name'],
      description: data['description'],
      address: data['address'],
      phoneNumber: data['phoneNumber'],
      openingTime: data['openingTime'],
      closingTime: data['closingTime'],
      deliveryAreas: data['deliveryAreas'],
    );
  }
}
