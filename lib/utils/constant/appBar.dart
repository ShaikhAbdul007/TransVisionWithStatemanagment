import 'package:flutter/material.dart';

class CustomerBar extends StatelessWidget {
  final String myText;
  const CustomerBar({Key? key, required this.myText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
      myText,
    ));
  }
}
