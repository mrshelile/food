import 'package:flutter/material.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/home/food_page_body.dart';
import 'package:foods/src/repository/authentication_repository/authentication_repository.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:foods/src/widgets/big_text.dart';
import 'package:foods/src/widgets/category_cell.dart';
import 'package:foods/src/widgets/round_textfield.dart';
import 'package:foods/src/widgets/small_text.dart';
import 'package:foods/src/widgets/view_all_title_row.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              _buildhead(),
              const SizedBox(
                height: 20,
              ),
              FoodPageBody(),
            ],
          ),
        ),
      ),

      // resizeToAvoidBottomInset: false,
    );
  }
}

Widget _buildhead() {
  return Container(
    child: Container(
      margin: EdgeInsets.only(
          top: Dimensions.height45, bottom: Dimensions.height15),
      padding:
          EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Good morning ", //${ServiceCall.userPayload[KKey.name] ?? ""}!",
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  IconButton(
                    icon: Icon(Icons.logout_outlined),
                    onPressed: () {
                      AuthenticationRepository.instance.logout();
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivering to",
                    style: TextStyle(color: AppColors.textColor, fontSize: 11),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.home,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              RoundTextfield(
                hintText: "Search Food",
                //controller: txtSearch,
                left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Iconsax.home,
                      ),
                    )),
              ),
            ]),
          )
        ],
      ),
    ),
  );
}
