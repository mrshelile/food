import 'package:flutter/material.dart';
import 'package:foods/src/features/authentication/controllers/signup_controller.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/food/orders.dart';
import 'package:foods/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:iconsax/iconsax.dart';

import 'pages/home/main_food_page.dart';
import 'pages/menu_screen.dart';
import 'pages/more_screen.dart';
import 'profile_screen.dart';

class ClientDashBoard extends StatefulWidget {
  ClientDashBoard({super.key});

  @override
  State<ClientDashBoard> createState() => _ClientDashBoardState();
}

class _ClientDashBoardState extends State<ClientDashBoard> {
  final controller = Get.put(SignUpController());

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    MainFoodPage(),
    Orders(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: false,
              notchColor: const Color(0xFF424242),

              /// restart app if you change removeMargins
              removeMargins: true,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                const BottomBarItem(
                  inActiveItem: Icon(
                    Iconsax.home,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Iconsax.home,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.shopping_bag,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
//          // ),
  }
}
