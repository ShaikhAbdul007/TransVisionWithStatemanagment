import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/model/bill_summary/summary_on_load_model.dart';
import 'package:tranvision_customer_app/model/bill_summary/summary_with_date_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class BillSummaryController extends GetxController {
  var formDateSelected = DateTime.now().obs;
  var toDateSelected = DateTime.now().obs;
  var billSumFormDate = TextEditingController();
  var billSumToDate = TextEditingController();
  var myList = <SummaryOnLoad>[].obs;
  var myListWithDate = <SummaryWithDate>[].obs;
  final myOurKey = GlobalKey<FormState>();
  UserLoginDetails user = UserLoginDetails();

  @override
  void onInit() {
    getSummaryOnLoadApi();
    super.onInit();
    user.retriveUserNameFromGetStrogare();
  }

  chooseFromDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: formDateSelected.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String billFormatDateFrom = DateFormat('yyyy-MM-dd').format(pickedDate);
      billSumFormDate.text = billFormatDateFrom;
    } else {
      return null;
    }
  }

  chooseToDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: toDateSelected.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));
    if (pickedDate != null) {
      String billFormatDateTo = DateFormat('yyyy-MM-dd').format(pickedDate);
      billSumToDate.text = billFormatDateTo;
    }
  }

  Future<List<SummaryOnLoad>> getSummaryOnLoadApi() async {
    var username = user.retriveUserNameFromGetStrogare();
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummaryOnLoad?partycode=P1210"));
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

  Future<RxList<SummaryWithDate>> getSummaryOnLoadApiWithDate() async {
    // UserLoginDetails user = UserLoginDetails();
    // var username = user.retrieveUserName();
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummarywithdate?partycode=P1210&fromdate=$billSumFormDate&todate=$billSumToDate"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      myListWithDate.value = [];
      for (Map i in data) {
        myListWithDate.add(SummaryWithDate.fromJson(i));
      }
      return myListWithDate;
    }
    return myListWithDate;
  }
}
