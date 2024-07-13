import 'package:flutter/material.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/utils/app_colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: Colors.white,
      backgroundColor: AppColors.mainColor,
      side: BorderSide(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: tButtonheight),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: AppColors.mainColor,
      backgroundColor: Colors.black54,
      side: BorderSide(color: AppColors.mainColor),
      padding: EdgeInsets.symmetric(vertical: tButtonheight),
    ),



  );
}
