import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/model/bill_summary/summary_on_load_model.dart';

class BillSummaryController extends GetxController {
  var isDataLoad = true.obs;
  var dateSelected = DateTime.now().obs;
  var billSumFormDate = TextEditingController();
  var billSumToDate = TextEditingController();
  var myList = <SummaryOnLoad>[].obs;

  @override
  void onInit() {
    getSummaryOnLoadApi();
    super.onInit();
  }

  chooseFromDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: dateSelected.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String billFormatDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      billSumFormDate.text = billFormatDate;
    } else {
      return null;
    }
  }

  chooseToDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: dateSelected.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));
    if (pickedDate != null) {
      String billFormatDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      billSumToDate.text = billFormatDate;
    }
  }

  Future<List<SummaryOnLoad>> getSummaryOnLoadApi() async {
    // UserLoginDetails user = UserLoginDetails();
    // var username = user.retrieveUserName();
    final response = await http.get(Uri.parse(
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/BillSummaryOnLoad?partycode=P1210"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      myList.value = [];
      for (Map i in data) {
        myList.add(SummaryOnLoad.fromJson(i));
      }
      return myList;
    }
    return myList;
  }
}
