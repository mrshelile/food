import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/more_screen.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:foods/src/widgets/app_column.dart';
import 'package:foods/src/widgets/big_text.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  final String mealName;
  final double mealPrice;
  final String mealImage;
  final int quantity;

  const Cart({
    required this.mealName,
    required this.mealPrice,
    required this.mealImage,
    required this.quantity,
  });

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Add any additional state variables or methods here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('You Cart'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height10,
              ),
              Container(
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
            ],
          ),
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
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: "\$${widget.mealPrice} "),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ChickingOut(
                          mealName: widget.mealName,
                          mealPrice: widget.mealPrice,
                          mealImage: widget.mealImage,
                          quantity: widget.quantity.toInt(),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    child: BigText(
                      text: "Check out",
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            )));
  }
}
