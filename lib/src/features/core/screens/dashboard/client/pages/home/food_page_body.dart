import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/food/cart.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/food/orders.dart';
import 'package:foods/src/features/core/screens/dashboard/client/pages/food/popular_food_details.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:foods/src/widgets/app_column.dart';
import 'package:foods/src/widgets/big_text.dart';
import 'package:foods/src/widgets/category_cell.dart';
import 'package:foods/src/widgets/icons_and_text_widget.dart';
import 'package:foods/src/widgets/recent_item_row.dart';
import 'package:foods/src/widgets/small_text.dart';
import 'package:foods/src/widgets/view_all_title_row.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 2450,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //slider section
          Container(
              //  color: Colors.red,
              height: Dimensions.pageView,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("meals")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      return SizedBox();
                    }
                    final meals = snapshot.data!.docs;

                    print(meals.first);

                    return PageView.builder(
                        controller: pageController,
                        itemCount: meals.length,
                        itemBuilder: (context, index) {
                          Matrix4 matrix = new Matrix4.identity();
                          if (index == _currPageValue.floor()) {
                            var currScale = 1 -
                                (_currPageValue - index) * (1 - _scaleFactor);
                            var currTrans = _height * (1 - currScale) / 2;

                            matrix = Matrix4.diagonal3Values(1, currScale, 1)
                              ..setTranslationRaw(0, currTrans, 0);
                          } else if (index == _currPageValue.floor() + 1) {
                            var currScale = _scaleFactor +
                                (_currPageValue - index + 1) *
                                    (1 - _scaleFactor);
                            var currTrans = _height * (1 - currScale) / 2;
                            matrix = Matrix4.diagonal3Values(1, currScale, 1);
                            matrix = Matrix4.diagonal3Values(1, currScale, 1)
                              ..setTranslationRaw(0, currTrans, 0);
                          } else if (index == _currPageValue.floor() - 1) {
                            var currScale = 1 -
                                (_currPageValue - index) * (1 - _scaleFactor);
                            var currTrans = _height * (1 - currScale) / 2;
                            matrix = Matrix4.diagonal3Values(1, currScale, 1);
                            matrix = Matrix4.diagonal3Values(1, currScale, 1)
                              ..setTranslationRaw(0, currTrans, 0);
                          } else {
                            var currScale = 0.8;
                            matrix = Matrix4.diagonal3Values(1, currScale, 1)
                              ..setTranslationRaw(
                                  0, _height * (1 - _scaleFactor) / 2, 1);
                          }

                          return Transform(
                            transform: matrix,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(PopularFoodDetail(
                                  mealName: meals[index]['name'],
                                  mealPrice: meals[index]['price'],
                                  mealImage: meals[index]['imageURL'] ?? '',
                                  mealCategory: meals[index]['category'],
                                  description: meals[index]['description'],
                                ));
                              },
                              child: Stack(children: [
                                Container(
                                  height: Dimensions.pageViewContainer,
                                  margin: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius30),
                                    color: index.isEven
                                        ? Color(0xff69c5df)
                                        : Color(0xff9294cc),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        meals[index]['imageURL'] ?? '',
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: Dimensions.pageViewContainer,
                                    margin: EdgeInsets.only(
                                        left: Dimensions.width40,
                                        right: Dimensions.width40,
                                        bottom: Dimensions.height15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xffe8e8e),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5)),
                                          BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(-5, 0)),
                                          BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(5, 0)),
                                        ]),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: Dimensions.height15,
                                          left: 15,
                                          right: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BigText(text: meals[index]['name']),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          Row(
                                            children: [
                                              Wrap(
                                                children: List.generate(
                                                  5,
                                                  (index) => Icon(
                                                    Icons.star,
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                  '\$${meals[index]['price']}'),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              SmallText(text: "1287"),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              SmallText(text: "Comments"),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Dimensions.height20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconAndtextWidget(
                                                  icon: Icons.circle_sharp,
                                                  text: "Normal",
                                                  iconColor:
                                                      AppColors.iconColor1),
                                              IconAndtextWidget(
                                                  icon: Icons.location_on,
                                                  text: "1.8km",
                                                  iconColor:
                                                      AppColors.mainColor),
                                              IconAndtextWidget(
                                                  icon:
                                                      Icons.access_time_rounded,
                                                  text: "32min",
                                                  iconColor:
                                                      AppColors.iconColor2),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        });
                  })),

          //dots
          DotsIndicator(
            dotsCount: 5,
            position: _currPageValue.toInt(),
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),

          //Popular Text
          SizedBox(
            height: Dimensions.height20,
          ),
          Container(
            margin: EdgeInsets.only(left: Dimensions.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular"),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 3.0),
                  child: BigText(
                    text: ".",
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 2.0),
                  child: SmallText(text: "Dishes"),
                )
              ],
            ),
          ),
          //List of restraurants
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("meals").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return SizedBox();
              }

              final meals = snapshot.data!.docs;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: meals.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => PopularFoodDetail(
                              mealName: meals[index]['name'],
                              mealPrice: meals[index]['price'],
                              mealImage: meals[index]['imageURL'] ?? '',
                              mealCategory: meals[index]['category'],
                              description: meals[index]['description'],
                            ));
                      },
                      child: Container(
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
                                    meals[index]['imageURL'] ?? '',
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
                                      text: meals[index]['name'],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
            },
          )
        ],
      ),
    );
  }
}
