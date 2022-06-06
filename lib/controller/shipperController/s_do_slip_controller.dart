import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoSlip extends GetxController {
  var selectedDate = DateTime.now().obs;
  var  doSlipFromDate = TextEditingController();
  var doSlipToDate = TextEditingController();
  var doSlipReference=TextEditingController();


  chooseFromDate() async {
    DateTime? pickedDate = await showDatePicker(

        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String formatFromDate= DateFormat('yyyy-MM-dd').format(pickedDate);
      doSlipFromDate.text = formatFromDate;
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
      String formatToDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      doSlipToDate.text= formatToDate;
    } else {
      return null;
    }
  }
}


