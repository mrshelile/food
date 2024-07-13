import 'package:flutter/material.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:foods/src/widgets/big_text.dart';
import 'package:foods/src/widgets/icons_and_text_widget.dart';
import 'package:foods/src/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  
  const AppColumn({Key? key, required this.text, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigText(
          text: text,
          size: Dimensions.font16,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SmallText(
          text: text,
           
        ),
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
              width: Dimensions.width10,
            ),
            SmallText(text: "4.0"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "128"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "Comments"),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconAndtextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndtextWidget(
                icon: Icons.location_on,
                text: "1.8km",
                iconColor: AppColors.mainColor),
            IconAndtextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
