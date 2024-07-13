import 'package:flutter/material.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("OR"),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 50,
                child: SizedBox(
                  width: double.maxFinite,
                  child: OutlinedButton.icon(
                    icon: Image(
                      image: AssetImage("assets/logos/google_logo.png"),
                      width: 20,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                    ),
                    onPressed: () {},
                    label: Text("Sign in With Google".toUpperCase()),
                  ),
                )),
            SizedBox(height: 10),
            TextButton(
                onPressed: () {},
                child: Text.rich(TextSpan(
                    text: "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                          text: " Login",
                          style: TextStyle(color: Colors.blue)),
                    ])))
          ],
        ),
      ),
    );
  }
}
