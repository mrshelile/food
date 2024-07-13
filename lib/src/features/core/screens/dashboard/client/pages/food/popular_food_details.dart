import 'package:flutter/material.dart';
import 'package:foods/src/features/core/screens/dashboard/client/client_dashboard.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/home/main_food_page.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/menu_screen.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:foods/src/widgets/app_column.dart';
import 'package:foods/src/widgets/app_icon.dart';
import 'package:foods/src/widgets/big_text.dart';
import 'package:foods/src/widgets/exdandable_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatefulWidget {
  final String mealName;
  final String mealCategory;
  final double mealPrice;
  final String mealImage;
  final String description;

  PopularFoodDetail({
    required this.mealName,
    required this.mealCategory,
    required this.mealPrice,
    required this.mealImage,
    required this.description,
  });

  @override
  State<PopularFoodDetail> createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.mealImage,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => ClientDashBoard());
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: '${widget.mealName}',
                      //price: double.parse(${widget.mealPrice * _quantity})
                    ),
                    Text('\$${widget.mealPrice * _quantity}'),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "More Details"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text: '${widget.description}')))
                  ],
                ),
              ))

          //expandable text widget
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _quantity = (_quantity > 1) ? _quantity - 1 : _quantity;
                      });
                    },
                    child: Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: '$_quantity'),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _quantity += 1;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  )
                ],
              )),
          GestureDetector(
            onTap: () {
              Get.to(() => Cart(
                    mealName: widget.mealName,
                    mealPrice: widget.mealPrice * _quantity,
                    mealImage: widget.mealImage,
                    quantity: _quantity,
                  ));
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: BigText(
                text: "\$${widget.mealPrice * _quantity} | Add to cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor),
            ),
          )
        ]),
      ),
    );
  }
}
