import 'package:flutter/material.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/utils/app_colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: AppColors.mainColor,
      side: BorderSide(color: AppColors.mainBlackColor),
      padding: EdgeInsets.symmetric(vertical: tButtonheight),
    ),
  );

   static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: AppColors.mainBlackColor,
      side: BorderSide(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: tButtonheight),
    ),
  );


}
