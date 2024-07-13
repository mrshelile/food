import 'package:flutter/material.dart';
import 'package:foods/src/constants/image_strings.dart';

class loginHeaderWidget extends StatelessWidget {
  const loginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(tWelcomeScreenImage),
          height: size.height * 0.2,
        ),
        Text(
          "Login",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text("Hello there welcome back"),
      ],
    );
  }
}
