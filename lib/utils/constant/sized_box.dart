import 'package:flutter/material.dart';

class SizeBox {
  static customHeight(double height) {
    return SizedBox(
      height: height,
    );
  }

  static customHeightWidth(double hSize,double wSize) {
    return SizedBox(
      height: hSize,
      width: wSize,
    );
  }

  static customWidth(double width) {
    return SizedBox(
      width: width,
    );
  }
}
