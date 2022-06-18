import 'package:get/get.dart';
import 'package:tranvision_customer_app/api_services/api_services.dart';
import 'package:tranvision_customer_app/controller/authController/login_controller.dart';
import 'package:tranvision_customer_app/model/profile_model/user_profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var isLoading = true.obs;
  final profileModel = [].obs;
  LoginController loginController = Get.put(LoginController());

  // Future<RxList> fetchUserDetailApi() async {
  //   final response = await http.get(Uri.parse(
  //       ApiServices.consigneeLoginUrl(loginController.username.text)));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     profileModel.value = [];
  //     for (Map i in data) {
  //       profileModel.add(ProfileModel.fromJson(i));
  //     }
  //     return profileModel;
  //   }
  //   return profileModel;
  // }
}
