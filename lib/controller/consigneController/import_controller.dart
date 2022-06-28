import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ImportController extends GetxController {
  var importReference = TextEditingController();
  var importFromDate = TextEditingController();
  var importToDate = TextEditingController();
  var selectedDate = DateTime.now().obs;

  chooseFromDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));
    if (picked != null) {
      String formatDate = DateFormat('yyyy-MM-dd').format(picked);
      importFromDate.text = formatDate;
    }
  }

  chooseToDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));
    if (picked != null) {
      String formatDate = DateFormat('yyyy-MM-dd').format(picked);
      importToDate.text = formatDate;
    }
  }
}
