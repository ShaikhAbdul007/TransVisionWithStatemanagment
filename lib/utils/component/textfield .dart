import 'package:flutter/material.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';

class CustomField extends StatelessWidget {
  final TextEditingController myEditingController;
  final String hint;

  const CustomField({
    Key? key,
    required this.myEditingController,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myEditingController,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
