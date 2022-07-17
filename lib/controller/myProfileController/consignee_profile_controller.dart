import 'dart:io';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_services/consignee_api.dart';
import 'package:tranvision_customer_app/model/profile_model/consignee_profile_data_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class ConsigneeController extends GetxController {
  UserLoginDetails userLoginDetails = UserLoginDetails();
  @override
  void onInit() {
    super.onInit();
    getuserDetailsApi();
  }

  Future<Userdetails> getuserDetailsApi() async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    try {
      final response =
          await http.get(Uri.parse(ConsigneeApi.consigneeLoginUrl(username)));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return Userdetails.fromJson(data);
      } else {
        throw Exception("Api Failed");
      }
    } on SocketException {
      return Future.error("No Internet Connection");
    } on HttpException {
      return Future.error("Server Error");
    }
  }
}
