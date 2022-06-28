import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_services/shipper_do_slip_api.dart';
import 'package:tranvision_customer_app/model/do_slip_model/do_slip_on_load_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class DoSlip extends GetxController {
  var selectedDate = DateTime.now().obs;
  var doSlipFromDate = TextEditingController();
  var doSlipToDate = TextEditingController();
  var doSlipReference = TextEditingController();
  var myDoList = <DoSlipOnLoad>[].obs;
  UserLoginDetails userLoginDetails = UserLoginDetails();
  @override
  void onInit() {
    getDoSlipApi();
    super.onInit();
  }

  chooseFromDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String formatFromDate = DateFormat('yyyy-MM-dd').format(pickedDate);
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
      doSlipToDate.text = formatToDate;
    } else {
      return null;
    }
  }

  Future<List<DoSlipOnLoad>> getDoSlipApi() async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response = await http.get(Uri.parse(DoSlipApi.doSlipUrl(username)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      myDoList.value = [];
      for (Map i in data) {
        myDoList.add(DoSlipOnLoad.fromJson(i));
      }
      return myDoList;
    }
    return myDoList;
  }
}
