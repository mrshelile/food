import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:foods/src/features/authentication/controllers/signup_controller.dart';
import 'package:get/get.dart';

class DropdownButtonWidget extends StatefulWidget {
  final void Function(String) onRoleChanged; // Callback function

  const DropdownButtonWidget({required this.onRoleChanged});

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  final List<String> options = [
    'Client',
    'Restraurant',
  ];

  var _currentItemSelected = "Client";

  var role = "Client";
  final controller = Get.find<SignUpController>();

  final valueListenable = ValueNotifier<String?>(null);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        // Add Horizontal padding using menuItemStyleData.padding so it matches
        // the menu padding when button's width is not specified.
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // Add more decoration..
      ),
      hint: const Text(
        'Select Your Role',
        style: TextStyle(fontSize: 14),
      ),
      items: options.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(
            dropDownStringItem,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        );
      }).toList(),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please select a role.'; // Updated validation message
      //   }
      //   return null;
      // },
      onChanged: (newValueSelected) {
        setState(() {
          _currentItemSelected = newValueSelected ?? "Client";
          role = newValueSelected!;
          widget.onRoleChanged(role);
          controller.role(newValueSelected);
        });
      },
      value: _currentItemSelected,
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
