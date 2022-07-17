import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/api_handing/http_network/base_api_service.dart';
import 'package:tranvision_customer_app/api_handing/http_network/network_api_service.dart';
import 'package:tranvision_customer_app/api_services/login_api.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';
import 'package:tranvision_customer_app/utils/component/consignee_bottom_navigation.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class NewLoginController extends GetxController {
  final BaseApiService _apiService = NetworkApiServices();
  final username = TextEditingController();
  final password = TextEditingController();
  UserLoginDetails user = UserLoginDetails();

  Future<dynamic> loginApi() async {
    try {
      dynamic response = await _apiService
          .fetchGetApiResponse(LoginApi.loginUrl(username, password));
      if ((response)["loginResult"] == "Consignee Login") {
        user.saveUserName(username.text);
        user.retriveUserNameFromGetStrogare();
        Get.snackbar("Welcome Consignee", "",
            messageText: SemiWeighText(
                text: "Please Wait While Going Ahead",
                size: 18.sp,
                color: AppColor.textColor),
            showProgressIndicator: true,
            icon: const Icon(Icons.person_outline, color: Colors.white),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.orangeAccent,
            borderRadius: 15.r,
            margin: EdgeInsets.all(12.r),
            colorText: AppColor.textColor,
            duration: const Duration(seconds: 2),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
            dismissDirection: DismissDirection.vertical);
        await Future.delayed(const Duration(seconds: 3));
        Get.to(() => const ConsigneeBottomNavigation());
      } else if ((response)["loginResult"] == "Shipper Login") {
        user.saveUserName(username.text);
        user.retriveUserNameFromGetStrogare();
        Get.snackbar("Welcome Shipper", "",
            messageText: SemiWeighText(
                text: "Please Wait While Going Ahead",
                size: 18.sp,
                color: AppColor.textColor),
            showProgressIndicator: true,
            icon: const Icon(Icons.person_outline, color: Colors.white),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.orangeAccent,
            borderRadius: 15.r,
            margin: const EdgeInsets.all(12),
            colorText: AppColor.textColor,
            duration: const Duration(seconds: 2),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
            dismissDirection: DismissDirection.horizontal);
        await Future.delayed(const Duration(seconds: 2));
        Get.offNamed('/nav');
      } else {
        Get.snackbar("Login Failed", "",
            messageText: SemiWeighText(
                text: "Enter the Correct Details",
                size: 18.sp,
                color: AppColor.textColor),
            icon: const Icon(Icons.person_add_disabled, color: Colors.white),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.orangeAccent,
            borderRadius: 15.r,
            margin: EdgeInsets.all(12.r),
            colorText: AppColor.textColor,
            duration: const Duration(seconds: 2),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
            dismissDirection: DismissDirection.horizontal);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
