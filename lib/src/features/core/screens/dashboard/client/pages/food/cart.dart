// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, unused_import

// import 'package:flutter/material.dart';


// class OrderCartPage extends StatefulWidget {
//   final String mealName;
//   final String mealCategory;
//   final double mealPrice;
//   final String mealImage;

//   OrderCartPage({
//     required this.mealName,
//     required this.mealCategory,
//     required this.mealPrice,
//     required this.mealImage,
//   });

//   @override
//   _OrderCartPageState createState() => _OrderCartPageState();
// }

// class _OrderCartPageState extends State<OrderCartPage> {
//   int _quantity = 1; // Initialize quantity to 1

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Meal Details'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite_border),
//             onPressed: () {
//               // Handle favorite button press logic
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Image.network(
//             widget.mealImage,
//             width: double.infinity,
//             height: 190.0,
//           ),
//           Row(
//             children: [
//               SizedBox(width: 17.0),
//               Text(
//                 widget.mealName,
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(width: 90.0),
//               Text(
//                 '\$${widget.mealPrice * _quantity}', // Calculate total price based on quantity
//                 style: TextStyle(fontSize: 24.0),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 16,
//               ),
//               Icon(Icons.star, color: Colors.amber),
//               Icon(Icons.star, color: Colors.amber),
//               Icon(Icons.star, color: Colors.amber),
//               Icon(Icons.star, color: Colors.amber),
//               Icon(Icons.star_border,
//                   color: Colors.amber), // Use star_border for unfilled star
//             ],
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 17,
//               ),
//               Text(
//                 'Ingredients',
//                 style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 17,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(155, 8, 150, 81),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 width: 60.0, // Set a fixed width for each category container
//                 margin:
//                     EdgeInsets.only(right: 10.0), // Add some margin for spacing
//                 child: Image.network(
//                   widget.mealImage,
//                   width: double.infinity,
//                   height: 30.0,
//                 ),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(155, 8, 150, 81),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 width: 60.0, // Set a fixed width for each category container
//                 margin:
//                     EdgeInsets.only(right: 10.0), // Add some margin for spacing
//                 child: Image.network(
//                   widget.mealImage,
//                   width: double.infinity,
//                   height: 30.0,
//                 ),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(155, 8, 150, 81),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 width: 60.0, // Set a fixed width for each category container
//                 margin:
//                     EdgeInsets.only(right: 10.0), // Add some margin for spacing
//                 child: Image.network(
//                   widget.mealImage,
//                   width: double.infinity,
//                   height: 30.0,
//                 ),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(155, 8, 150, 81),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 width: 60.0, // Set a fixed width for each category container
//                 margin:
//                     EdgeInsets.only(right: 10.0), // Add some margin for spacing
//                 child: Image.network(
//                   widget.mealImage,
//                   width: double.infinity,
//                   height: 30.0,
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 17,
//               ),
//               Text(
//                 'Description',
//                 style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 17,
//               ),
//               Expanded(
//                 child: Text(
//                   'This beef burger uses 100% quality beef with sliced tomatoes, cucumbers, vegetables and onions...Read more',
//                   style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 15,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(155, 8, 150, 81),
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     width: 40.0,
//                     height: 33,
//                     child: IconButton(
//                       icon: Icon(Icons.remove),
//                       iconSize: 15,
//                       onPressed: () {
//                         setState(() {
//                           // Ensure quantity is never less than 1
//                           _quantity =
//                               (_quantity > 1) ? _quantity - 1 : _quantity;
//                         });
//                       },
//                     ),
//                   ),
//                   Text(
//                     '$_quantity', // Replace with actual burger quantity
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(155, 8, 150, 81),
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     width: 40.0,
//                     height: 33,
//                     child: IconButton(
//                       icon: Icon(Icons.add),
//                       iconSize: 15,
//                       onPressed: () {
//                         setState(() {
//                           _quantity += 1;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(width: 80.0),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Cart(
//                               mealName: widget.mealName,
//                               mealPrice: widget.mealPrice * _quantity,
//                               mealImage: widget.mealImage,
//                               quantity: _quantity,
//                             )),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       Color.fromARGB(155, 8, 150, 81), // Green button color
//                 ),
//                 child:
//                     Text('Add to Cart', style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
