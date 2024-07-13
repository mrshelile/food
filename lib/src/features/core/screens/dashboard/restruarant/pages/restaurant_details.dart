import 'package:flutter/material.dart';
import 'package:foods/src/features/core/models/restraurant_info_model.dart';
import 'package:foods/src/features/core/screens/dashboard/admin/admin_dashboard.dart';
import 'package:foods/src/features/core/screens/dashboard/admin/pending_approval_screen.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/food/popular_food_details.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:foods/src/widgets/app_column.dart';
import 'package:foods/src/widgets/app_icon.dart';
import 'package:get/get.dart';

class RestaurantDetailsPage extends StatefulWidget {
  final Map restaurant; // Assuming a RestaurantModel object is passed

  const RestaurantDetailsPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  _RestaurantDetailsPageState createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  List picked = [false, false];

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
                    ]),
              ),
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
                      Get.to(() => PendinApprovalPage());
                    }),
              ),
              Positioned(
                  top: 60.0,
                  left: 30.0,
                  child: Text(
                    "${widget.restaurant['name']} -Restaurant",
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
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10),
                      child: Column(
                        children: [
                          ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.blue.withOpacity(0.4),
                            leading: Icon(Icons.person),
                            title: Text("Email: ${widget.restaurant['user']}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: Dimensions.height10),
                                Text(
                                    "Description: ${widget.restaurant['description']}"),
                                SizedBox(height: Dimensions.height10),
                                Text(
                                    "Contact Number: ${widget.restaurant['phoneNumber']}"),
                                SizedBox(height: Dimensions.height10),
                                Text(
                                    "Location: ${widget.restaurant['address']}"),
                                SizedBox(height: Dimensions.height10),
                                Text(
                                    "Delivery Areas: ${widget.restaurant['deliveryAreas']}"),
                                SizedBox(height: Dimensions.height10),
                                Text(
                                    "Opening Time: ${widget.restaurant['OpeningTime']}"),
                                SizedBox(height: Dimensions.height10),
                                Text(
                                    "Closing Time: ${widget.restaurant['closingTime']}"),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Deny".toUpperCase(),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Approve".toUpperCase(),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
