import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingReportController extends GetxController {
  var bookingDateSelected = DateTime.now().obs;
  var bookingFromDate = TextEditingController();
  var bookingToDate = TextEditingController();

  chooseFromDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: bookingDateSelected.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String bookingFormatDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      bookingFromDate.text = bookingFormatDate;
    } else {
      return null;
    }
  }

  chooseToDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: bookingDateSelected.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String bookingFormatDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      bookingToDate.text = bookingFormatDate;
    } else {
      return null;
    }
  }
}
