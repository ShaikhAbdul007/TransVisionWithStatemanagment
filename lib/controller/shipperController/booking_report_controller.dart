import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_services/reports_api.dart';
import 'package:tranvision_customer_app/model/booking_report_model/report_on_load_model.dart';
import 'package:tranvision_customer_app/model/booking_report_model/report_on_refresh_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class ReportController extends GetxController {
  var bookingDateSelected = DateTime.now().obs;
  var reportSelectedFromDate = TextEditingController();
  var reportSelectedToDate = TextEditingController();
  var reportOnLoadList = <ReportOnLoad>[].obs;
  var reportOnRefreshList = <ReportOnRefreshLoad>[].obs;
  final reportKey = GlobalKey<FormState>();
  UserLoginDetails userLoginDetails = UserLoginDetails();

  @override
  void onInit() {
    super.onInit();
    getReportOnLoadApi();
    fetchreportonRefreshApi();
  }

  chooseFromDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: bookingDateSelected.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String bookingFormatDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      reportSelectedFromDate.text = bookingFormatDate;
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
      reportSelectedToDate.text = bookingFormatDate;
    } else {
      return null;
    }
  }

  Future<List<ReportOnLoad>> getReportOnLoadApi() async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response = await http.get(Uri.parse(ReportApis.reportUrl(username)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      reportOnLoadList.value = [];
      for (Map i in data) {
        reportOnLoadList.add(ReportOnLoad.fromJson(i));
      }
      return reportOnLoadList;
    }
    return reportOnLoadList;
  }

  // Future<RxList<ReportOnRefreshLOad>> getReportOnRefreshApi() async {
  //   var username = userLoginDetails.retriveUserNameFromGetStrogare();
  //   final response = await http.get(Uri.parse(ReportApis.reportRefreshUrl(
  //       username, reportSelectedFromDate.text, reportSelectedToDate.text)));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     reportOnRefreshList.value = [];
  //     for (Map i in data) {
  //       reportOnRefreshList.add(ReportOnRefreshLOad.fromJson(i));
  //     }
  //     return reportOnRefreshList;
  //   }
  //   return reportOnRefreshList;
  // }

  Future<List<ReportOnRefreshLoad>> fetchreportonRefreshApi() async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response = await http.get(Uri.parse(ReportApis.reportRefreshUrl(
        username, reportSelectedFromDate.text, reportSelectedToDate.text)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      reportOnRefreshList.value = [];
      for (Map i in data) {
        reportOnRefreshList.add(ReportOnRefreshLoad.fromJson(i));
      }
      return reportOnRefreshList;
    }
    return reportOnRefreshList;
  }
}
