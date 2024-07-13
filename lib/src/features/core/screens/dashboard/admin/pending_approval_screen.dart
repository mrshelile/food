import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foods/src/features/core/controllers/admin_controller.dart';
import 'package:foods/src/features/core/screens/dashboard/admin/admin_dashboard.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/food/popular_food_details.dart';
import 'package:foods/src/features/core/screens/dashboard/restruarant/pages/restaurant_details.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:foods/src/widgets/app_column.dart';
import 'package:foods/src/widgets/app_icon.dart';
import 'package:get/get.dart';

import '../../../models/restraurant_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PendinApprovalPage extends StatefulWidget {
  @override
  _PendinApprovalPageState createState() => _PendinApprovalPageState();
}

class _PendinApprovalPageState extends State<PendinApprovalPage> {
  final controller = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Stack(children: [
            Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
              ),
              Container(
                  height: 250.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Color(0xFFFDD148),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe8e8e),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                        BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                      ])),
              Positioned(
                bottom: 450.0,
                right: 100.0,
                child: Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: Color(0xFFFEE16D),
                  ),
                ),
              ),
              Positioned(
                bottom: 500.0,
                left: 150.0,
                child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Color(0xFFFEE16D).withOpacity(0.5))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: IconButton(
                    alignment: Alignment.topLeft,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.to(() => AdminDashboard());
                    }),
              ),
              Positioned(
                  top: 75.0,
                  left: 15.0,
                  child: Text(
                    'Restaurants Waiting \n For Approval',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  )),
              Positioned(
                top: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.maxFinite,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("restaurants")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError || !snapshot.hasData) {
                            return SizedBox();
                          }
                          final restaurants = snapshot.data!.docs;

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: restaurants.length,
                            itemBuilder: (context, index) {
                              final restaurant = restaurants[index]
                                  .data(); // Access current restaurant
                              // print(restaurant);
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => RestaurantDetailsPage(
                                      restaurant: restaurant));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: Dimensions.width20,
                                    right: Dimensions.width20,
                                    bottom: Dimensions.height10,
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        iconColor: Colors.blue,
                                        tileColor: Colors.blue.withOpacity(0.3),
                                        leading: Icon(Icons.person),
                                        title: Text(
                                            "Name: ${restaurant['name']}"), // Use restaurant name
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "Contact Number: ${restaurant['phoneNumber']}"),
                                            Text(
                                                "Location: ${restaurant['address']}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ])
          ])
        ]));
  }
}
