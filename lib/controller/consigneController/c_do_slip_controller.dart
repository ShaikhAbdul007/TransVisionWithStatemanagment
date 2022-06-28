import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConsigneDoSlip extends GetxController {
  var doReference = TextEditingController();
  var consigneeDoSlipFromDate = TextEditingController();
  var consigneeDoSlipToDate = TextEditingController();
  var selectedDate = DateTime.now().obs;

  chooseFromDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String formatFromDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      consigneeDoSlipFromDate.text = formatFromDate;
    } else {
      return null;
    }
  }

  chooseToDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String formatFormDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      consigneeDoSlipToDate.text = formatFormDate;
    }
  }
}
