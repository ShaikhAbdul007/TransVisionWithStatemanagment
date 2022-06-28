import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_services/bill_of_ladding_api.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/bill_of_lading_controller/bill_of_lading.dart';
import 'package:tranvision_customer_app/model/bill_of_landing_model/bill_of_lading_new.dart';
import 'package:tranvision_customer_app/model/bill_of_landing_model/bill_of_lading_on_refresh.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class BillOfLaddingHome extends GetxController {
  BillOfLadding billofLadding = Get.find();
  var billOfLadingOnLoad = <BillOfLadingNew>[].obs;
  var billOfLadingOnRefresh = <BillOfLadingORefershModel>[].obs;
  UserLoginDetails userLoginDetails = UserLoginDetails();

  @override
  void onInit() {
    getBillOfLandingOnLoadApi();
    getBillOfLandingRefresh();
    super.onInit();
  }

  Future<List<BillOfLadingNew>> getBillOfLandingOnLoadApi() async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response = await http
        .get(Uri.parse(BillOfLaddingApi.billOfLaddingOnLoad(username)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      billOfLadingOnLoad.value = [];
      for (Map i in data) {
        billOfLadingOnLoad.add(BillOfLadingNew.fromJson(i));
      }
      return billOfLadingOnLoad;
    }
    return billOfLadingOnLoad;
  }

  Future<List<BillOfLadingORefershModel>> getBillOfLandingRefresh() async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response = await http.get(Uri.parse(
        BillOfLaddingApi.billOfLaddingOnRefresh(username,
            billofLadding.selectedValue, billofLadding.billController.text)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      billOfLadingOnRefresh.value = [];
      for (Map i in data) {
        billOfLadingOnRefresh.add(BillOfLadingORefershModel.fromJson(i));
      }
      return billOfLadingOnRefresh;
    }
    return billOfLadingOnRefresh;
  }
}
