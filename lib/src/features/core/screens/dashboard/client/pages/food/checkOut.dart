
// import 'package:flutter/material.dart';
// import 'package:foods/src/features/core/screens/dashboard/client/pages/food/no_data_page.dart';
// import 'package:foods/src/utils/app_colors.dart';
// import 'package:foods/src/utils/dimensions.dart';
// import 'package:foods/src/widgets/app_icon.dart';
// import 'package:foods/src/widgets/big_text.dart';
// import 'package:foods/src/widgets/small_text.dart';
// import 'package:get/get.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: Dimensions.height20 * 3,
//             left: Dimensions.width20,
//             right: Dimensions.width20,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppIcon(
//                   icon: Icons.arrow_back_ios,
//                   iconColor: Colors.white,
//                   backgroundColor: AppColors.mainColor,
//                   size: Dimensions.iconSize40,
//                 ),
//                 SizedBox(
//                   width: Dimensions.width20 * 5,
//                 ),
//                 GestureDetector(
//                   onTap: () {
                    
//                   },
//                   child: AppIcon(
//                     icon: Icons.home,
//                     iconColor: Colors.white,
//                     backgroundColor: AppColors.mainColor,
//                     size: Dimensions.iconSize40,
//                   ),
//                 ),
//                 AppIcon(
//                   icon: Icons.shopping_cart,
//                   iconColor: Colors.white,
//                   backgroundColor: AppColors.mainColor,
//                   size: Dimensions.iconSize40,
//                 ),
//               ],
//             ),
//           ),
//           GetBuilder<>(builder: (_cartController) {
//             return _cartController.getItems.length > 0
// //                ? Positioned(
//                     top: Dimensions.height20 * 5,
//                     left: Dimensions.width20,
//                     right: Dimensions.width20,
//                     bottom: 0,
//                     child: Container(
//                       margin: EdgeInsets.only(top: Dimensions.height15),
//                       // color: Colors.red,
//                       child: MediaQuery.removePadding(
//                           context: context,
//                           removeTop: true,
//                           child: GetBuilder<>(
//                             builder: (cartController) {
//                               var _cartList = cartController.getItems;
//                               return ListView.builder(
//                                   itemCount: _cartList.length,
//                                   itemBuilder: (_, index) {
//                                     return Container(
//                                       width: double.maxFinite,
//                                       height: Dimensions.height20 * 5,
//                                       margin: EdgeInsets.only(
//                                         bottom: Dimensions.height10,
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           GestureDetector(
//                                             onTap: (() {
                                             
                                              
//                                             }),
//                                             child: Container(
//                                               width: Dimensions.height20 * 5,
//                                               height: Dimensions.height20 * 5,
//                                               decoration: BoxDecoration(
//                                                 image: DecorationImage(
//                                                     fit: BoxFit.cover,
//                                                     image: NetworkImage(
//                                                        )),
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         Dimensions.radius20),
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: Dimensions.width10,
//                                           ),
//                                           Expanded(
//                                               child: Container(
//                                             height: Dimensions.height20 * 5,
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 BigText(
//                                                   text: cartController
//                                                       .getItems[index].name!,
//                                                   color: Colors.black54,
//                                                 ),
//                                                 SmallText(text: "Spicy"),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     BigText(
//                                                       text: cartController
//                                                           .getItems[index]
//                                                           .price!
//                                                           .toString(),
//                                                       color: Colors.redAccent,
//                                                     ),
//                                                     Container(
//                                                       padding: EdgeInsets.only(
//                                                         top:
//                                                             Dimensions.height10,
//                                                         bottom:
//                                                             Dimensions.height10,
//                                                         left:
//                                                             Dimensions.width10,
//                                                         right:
//                                                             Dimensions.width10,
//                                                       ),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius.circular(
//                                                                 Dimensions
//                                                                     .radius20),
//                                                         color: Colors.white,
//                                                       ),
//                                                       child: Row(
//                                                         children: [
//                                                           GestureDetector(
//                                                             onTap: () {
//                                                               cartController.addItem(
//                                                                   _cartList[
//                                                                           index]
//                                                                       .product!,
//                                                                   -1);
//                                                             },
//                                                             child: Icon(
//                                                               Icons.remove,
//                                                               color: AppColors
//                                                                   .signColor,
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: Dimensions
//                                                                     .width10 /
//                                                                 2,
//                                                           ),
//                                                           // popularProduct.inCartItems.toString()
//                                                           BigText(
//                                                               text: _cartList[
//                                                                       index]
//                                                                   .quantity
//                                                                   .toString()),
//                                                           SizedBox(
//                                                             width: Dimensions
//                                                                     .width10 /
//                                                                 2,
//                                                           ),
//                                                           GestureDetector(
//                                                             onTap: () {
//                                                               cartController.addItem(
//                                                                   _cartList[
//                                                                           index]
//                                                                       .product!,
//                                                                   1);
//                                                             },
//                                                             child: Icon(
//                                                               Icons.add,
//                                                               color: AppColors
//                                                                   .signColor,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                         ],
//                                       ),
//                                     );
//                                   });
//                             },
//                           )),
//                     ),
//                   )
//                 : NoDataPage();
//           })
//         ],
//       ),
//       bottomNavigationBar:  
//          Container(
//             height: Dimensions.bottomHeightBar,
//             padding: EdgeInsets.only(
//                 top: Dimensions.height30,
//                 bottom: Dimensions.height30,
//                 left: Dimensions.width20,
//                 right: Dimensions.width20),
//             decoration: BoxDecoration(
//               color: AppColors.buttonBackgroundColor,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(Dimensions.radius20 * 2),
//                 topRight: Radius.circular(Dimensions.radius20 * 2),
//               ),
//             ),
//             child: 
//                  Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.only(
//                           top: Dimensions.height20,
//                           bottom: Dimensions.height20,
//                           left: Dimensions.width20,
//                           right: Dimensions.width20,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.circular(Dimensions.radius20),
//                           color: Colors.white,
//                         ),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: Dimensions.width10 / 2,
//                             ),
//                             BigText(
//                                 text: "\$ " 
//                                     ),
//                             SizedBox(
//                               width: Dimensions.width10 / 2,
//                             ),
//                           ],
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           cartController.addToHistory();
//                         },
//                         child: Container(
//                           padding: EdgeInsets.only(
//                             top: Dimensions.height20,
//                             bottom: Dimensions.height20,
//                             left: Dimensions.width20,
//                             right: Dimensions.width20,
//                           ),
//                           child: BigText(
//                             text: "Check out",
//                             color: Colors.white,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.circular(Dimensions.radius20),
//                             color: AppColors.mainColor,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
                
//           );
//         },
//       ),
//     );
//   }
// }
