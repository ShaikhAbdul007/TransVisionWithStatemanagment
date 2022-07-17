import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final dynamic hint;

  const CustomField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
