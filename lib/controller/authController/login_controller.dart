import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tranvision_customer_app/api_services/api_services.dart';
import 'package:tranvision_customer_app/api_services/login_api.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';
import 'package:tranvision_customer_app/utils/component/shipper_bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class LoginController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = true.obs;
  UserLoginDetails user = UserLoginDetails();

  Future<dynamic> checkLogin() async {
    final isValid = formKey.currentState;
    if (isValid!.validate()) {
      final response = await http
          .get(Uri.parse(LoginApi.loginUrl(username.text, password.text)));
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)["loginResult"] == "Consignee Login") {
          user.saveUserName(username.text);
          user.retriveUserNameFromGetStrogare();
          Get.snackbar("Welcome Consignee", "",
              messageText: SemiWeighText(
                  text: "Please Wait While Going Ahead",
                  size: 18,
                  color: AppColor.textColor),
              showProgressIndicator: true,
              icon: const Icon(Icons.person_outline, color: Colors.white),
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.orangeAccent,
              borderRadius: 15,
              margin: const EdgeInsets.all(12),
              colorText: AppColor.textColor,
              duration: const Duration(seconds: 2),
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
              dismissDirection: DismissDirection.vertical);
          await Future.delayed(const Duration(seconds: 3));
          Get.to(() => const MyBottomNavigation());
        } else if (jsonDecode(response.body)["loginResult"] ==
            "Shipper Login") {
          user.saveUserName(username.text);
          user.retriveUserNameFromGetStrogare();
          Get.snackbar("Welcome Shipper", "",
              messageText: SemiWeighText(
                  text: "Please Wait While Going Ahead",
                  size: 18,
                  color: AppColor.textColor),
              showProgressIndicator: true,
              icon: const Icon(Icons.person_outline, color: Colors.white),
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.orangeAccent,
              borderRadius: 15,
              margin: const EdgeInsets.all(12),
              colorText: AppColor.textColor,
              duration: const Duration(seconds: 2),
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
              dismissDirection: DismissDirection.horizontal);
          await Future.delayed(const Duration(seconds: 2));
          Get.to(() => const MyBottomNavigation());
        } else {
          Get.snackbar("Login Failed", "",
              messageText: SemiWeighText(
                  text: "Enter the Correct Details",
                  size: 18.0,
                  color: AppColor.textColor),
              icon: const Icon(Icons.person_add_disabled, color: Colors.white),
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.orangeAccent,
              borderRadius: 15,
              margin: const EdgeInsets.all(12),
              colorText: AppColor.textColor,
              duration: const Duration(seconds: 2),
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
              dismissDirection: DismissDirection.horizontal);
        }
      }
    }
  }

  void toggle() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
