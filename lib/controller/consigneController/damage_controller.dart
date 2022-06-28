import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DamageController extends GetxController {
  var damageReference = TextEditingController();
  var damageFromDate = TextEditingController();
  var damageToDate = TextEditingController();
  var selectedDate = DateTime.now().obs;

  chooseFromDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));
    if (picked != null) {
      String formatDate = DateFormat('yyyy-MM-dd').format(picked);
      damageFromDate.text = formatDate;
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
      damageToDate.text = formatDate;
    }
  }
}
