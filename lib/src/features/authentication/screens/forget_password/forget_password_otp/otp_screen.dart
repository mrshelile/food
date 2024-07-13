import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:foods/src/constants/sizes.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CO\nDE",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 80.0)),
            Text(
              " verification".toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Enter the verification code sent at " + "Eric@gmail.com",
            ),
            SizedBox(
              height: 20,
            ),
            OtpTextField(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                print("OTP Is => $code");
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                //Get.to(() => OTPScreen());
              },
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(143, 148, 251, 1),
                      Color.fromRGBO(143, 148, 251, .6),
                    ])),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
