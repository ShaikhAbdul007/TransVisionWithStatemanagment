import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/model/profile_model/user_profile.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class ProfileController extends GetxController with UserLoginDetails {
  var isLoading = false.obs;
  var userDetails;

  @override
  void onInit() {
    super.onInit();
    userDetails = getUserApi();
  }

  Future<ProfileModel> getUserApi() async {
    var username = retriveUserNameFromGetStrogare();
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/consigneedata?username=C16"));
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      isLoading.value = true;
      return ProfileModel.fromJson(data);
    } else {
      throw Exception('Failed to API');
    }
  }

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
