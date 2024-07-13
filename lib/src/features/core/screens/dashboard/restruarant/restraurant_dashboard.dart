// import 'dart:developer';

// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:foods/src/features/core/screens/dashboard/restruarant/pages/finished_orders_screen.dart';
// import 'package:foods/src/features/core/screens/dashboard/restruarant/pages/menu_screen.dart';
// import 'package:foods/src/features/core/screens/dashboard/restruarant/pages/orders_screen.dart';
// import 'package:foods/src/features/core/screens/dashboard/restruarant/pages/settings_screen.dart';
// import 'package:foods/src/repository/authentication_repository/authentication_repository.dart';
// import 'package:foods/src/features/core/screens/dashboard/restruarant/restraurant_info.dart';
// import 'package:iconsax/iconsax.dart';

// class RestraurantDashBoard extends StatefulWidget {
//   const RestraurantDashBoard({super.key});

//   @override
//   State<RestraurantDashBoard> createState() => _RestraurantDashBoardState();
// }

// class _RestraurantDashBoardState extends State<RestraurantDashBoard> {
//   List bottomBarPages = [
//     AddFoodPage(),
//     OrderScreen(),
//     FinishedOrders(),
//     ProfilePage()
//   ];

//   int currentIndex = 0;
//   void onTap(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     //var _controller;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: bottomBarPages[currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//             unselectedFontSize: 0,
//             selectedFontSize: 0,
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.white,
//             onTap: onTap,
//             currentIndex: currentIndex,
//             selectedItemColor: Colors.black54,
//             unselectedItemColor: Colors.grey.withOpacity(0.5),
//             showUnselectedLabels: false,
//             showSelectedLabels: false,
//             elevation: 0,
            
//             items: <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                   label: "Home", icon: Icon(Icons.bar_chart_sharp)),
//               BottomNavigationBarItem(
//                   label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
//               BottomNavigationBarItem(
//                   label: "Search", icon: Icon(Icons.search)),
//               BottomNavigationBarItem(label: "My", icon: Icon(Icons.person)),
//             ])
// //          // ),
//         );
//   }
// }
