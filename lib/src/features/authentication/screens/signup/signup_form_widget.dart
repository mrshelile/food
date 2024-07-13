import 'package:flutter/material.dart';
import 'package:foods/src/features/authentication/controllers/signup_controller.dart';
import 'package:foods/src/features/core/models/user_models.dart';
import 'package:foods/src/features/authentication/screens/signup/dropdownbutton_widget.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    final _formKey = GlobalKey<FormState>();

    String role = "Client"; // Initialize with default role

    void _updateRole(String newRole) {
      role = newRole; // Update the role
    }

    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10)),
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      //height: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: AppColors.textColor)),
                        // color:Colors.white
                      ),
                      child: TextFormField(
                        controller: controller.fullName,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          border: InputBorder.none,
                          hintText: "Full Name",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: AppColors.textColor)),
                        // color:Colors.white
                      ),
                      child: TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.message),
                          border: InputBorder.none,
                          hintText: "Email ",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: AppColors.textColor)),
                        // color:Colors.white
                      ),
                      child: TextFormField(
                        controller: controller.phoneNo,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.mobile),
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.password,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.lock),
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonWidget(
                onRoleChanged: _updateRole,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                 

                    SignUpController.instance.registerUser(
                        controller.email.text.trim(),
                        controller.password.text.trim(),
                        role);
                    
                  }
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
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
