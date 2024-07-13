import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/home/food_page_body.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key});

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Orders';

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Get.to(
                () => MainFoodPage(),
              );
            }),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.account_circle),
              color: Colors.black,
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(155, 8, 150, 81),
      ),
      body: Column(
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextField(
          //     controller: _searchController,
          //     decoration: InputDecoration(
          //       labelText: "Search",
          //       hintText: "Search",
          //       prefixIcon: Icon(Icons.search),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(5.0),
          //         ),
          //       ),
          //     ),
          //     onChanged: (value) {
          //       setState(() {
          //         _searchText = value;
          //       });
          //     },
          //   ),
          // ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('orders').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                final orders = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index].data() as Map<String, dynamic>;
                    final orderId = orders[index].id;
                    final orderName = order['mealName'] ??
                        ''; // Provide default value for null
                    final orderStatus =
                        order['status'] ?? ''; // Provide default value for null
                    final deliveryMethod = order['deliveryMethod'] ??
                        ''; // Provide default value for null
                    final dateUploaded = (order['dateUploaded'] as Timestamp)
                        .toDate()
                        .toString();
                    final mealCode = order['mealCode'] ??
                        ''; // Provide default value for null
                    return _buildOrderListTile(context, orderId, orderName,
                        orderStatus, deliveryMethod, dateUploaded, mealCode);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _buildOrderListTile(
      BuildContext context,
      String orderId,
      String orderName,
      String orderStatus,
      String deliveryMethod,
      String dateUploaded,
      String mealCode) {
    return ListTile(
      title: Text('$orderName - $deliveryMethod'),
      subtitle: Text(orderStatus),
      onTap: () {
        _showOrderDetails(context, orderId, orderName, orderStatus,
            deliveryMethod, dateUploaded, mealCode);
      },
    );
  }

  void _showOrderDetails(
      BuildContext context,
      String orderId,
      String orderName,
      String orderStatus,
      String deliveryMethod,
      String dateUploaded,
      String mealCode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order No: $orderId'),
              Text('Meal Name: $orderName'),
              Text('Delivery Method: $deliveryMethod'),
              Text('Order Status: $orderStatus'),
              Text('Date Uploaded: $dateUploaded'),
              Text('Meal Code: $mealCode'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
