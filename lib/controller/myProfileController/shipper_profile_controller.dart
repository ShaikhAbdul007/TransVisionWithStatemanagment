import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tranvision_customer_app/api_services/shipper_api.dart';
import 'package:tranvision_customer_app/model/profile_model/shipper_profile_data_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class ShipperController extends GetxController {
  UserLoginDetails userLoginDetails = UserLoginDetails();
  @override
  void onInit() {
    super.onInit();
    getuserDetailsApi();
  }

  Future<ShipperProfileData> getuserDetailsApi() async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response =
        await http.get(Uri.parse(ShipperApi.shipperLoginUrl(username)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ShipperProfileData.fromJson(data);
    } else {
      throw Exception("Api Failed");
    }
  }
}
