import 'package:flutter/material.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:foods/src/constants/text_strings.dart';
import 'package:foods/src/features/authentication/models/model_on_boarding.dart';

class OnBoardingpages extends StatelessWidget {
  const OnBoardingpages({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.5,
          ),
          Column(
            children: [
              Text(
                tOnBoardingTittle1,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                tOnBoardingSubTittle2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(tOnBoardingCounter1),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
