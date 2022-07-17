import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BillOfLadding extends GetxController {
  List<String> item = [
    'BL No.',
    'Booking No.',
    'Place Of Loading',
    'Place Of Discharge',
    'Vessel/Voyage',
    'Place'
  ];

  var billController = TextEditingController();
  dynamic selectedValue;

  void dispose() {
    billController.dispose();
    super.dispose();
  }
}
