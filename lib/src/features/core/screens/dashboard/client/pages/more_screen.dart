// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/food/orders.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:foods/src/widgets/app_column.dart';

class ChickingOut extends StatefulWidget {
  final String mealName;
  final double mealPrice;
  final String mealImage;
  final int quantity;

  const ChickingOut({
    Key? key,
    required this.mealName,
    required this.mealPrice,
    required this.mealImage,
    required this.quantity,
  }) : super(key: key);

  @override
  _ChickingOutState createState() => _ChickingOutState();
}

class _ChickingOutState extends State<ChickingOut> {
  late String deliveryMethod;

  @override
  void initState() {
    super.initState();
    deliveryMethod = 'Delivery'; // Initialize delivery method to 'Delivery'
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comfirm Order'),
        actions: [],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.quantity.toInt(),
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          //image section in a row
                          Container(
                            height: Dimensions.ListViewImgSize,
                            width: Dimensions.ListViewImgSize,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white30,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  widget.mealImage,
                                ),
                              ),
                            ),
                          )
                          //text container
                          ,
                          Expanded(
                            child: Container(
                                height: Dimensions.ListViewtextContSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      Dimensions.radius20,
                                    ),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.width10,
                                      right: Dimensions.width10),
                                  child: AppColumn(
                                    text: '${widget.mealName}',
                                  ),
                                )),
                          ),
                        ],
                      ),
                    );
                  })),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '\$${widget.mealPrice}', // Update this with the total price
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Method:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                RadioListTile(
                  activeColor: Color.fromARGB(155, 8, 150, 81),
                  title: Text('Delivery'),
                  value: 'Delivery',
                  groupValue: deliveryMethod,
                  onChanged: (value) {
                    setState(() {
                      deliveryMethod = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Pickup'),
                  value: 'Pickup',
                  groupValue: deliveryMethod,
                  onChanged: (value) {
                    setState(() {
                      deliveryMethod = value.toString();
                    });
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _addToOrders(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(155, 8, 150, 81),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
              child: Text(
                'Check-out',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void _addToOrders(BuildContext context) {
    FirebaseFirestore.instance.collection('orders').add({
      'mealName': widget.mealName,
      'mealPrice': widget.mealPrice,
      'mealImage': widget.mealImage,
      'quantity': widget.quantity,
      'deliveryMethod':
          deliveryMethod, // Update with the selected delivery method
      'dateUploaded': Timestamp.now(), // Date when the meal was uploaded
    }).then((value) {
      // Order added successfully
      _showOrderConfirmedModal(context);
    }).catchError((error) {
      // Error occurred
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to place order: $error')),
      );
    });
  }

  void _showOrderConfirmedModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text('Order Confirmed'),
            ],
          ),
          content: Text('Your order has been Placed.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Orders(),
                ),
              ),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
