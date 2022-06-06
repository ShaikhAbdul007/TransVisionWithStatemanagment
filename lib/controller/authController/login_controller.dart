import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tranvision_customer_app/api_services/api_services.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';
import 'package:tranvision_customer_app/utils/component/shipper_bottom_navigation.dart';
import 'package:http/http.dart' as http;

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
          .get(Uri.parse(ApiServices.loginUrl(username.text, password.text)));
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)["loginResult"] == "Consignee Login") {
          user.save(username.text);
          user.retrieveUserName();
          Get.snackbar("Consignee Login SuccessFull", "Welcome",
              icon: const Icon(Icons.person, color: Colors.white),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.orangeAccent,
              borderRadius: 15,
              margin: const EdgeInsets.all(12),
              colorText: Colors.white,
              duration: const Duration(seconds: 2),
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
              dismissDirection: DismissDirection.horizontal);
          Get.to(() => const MyBottomNavigation());
        }
      } else if (jsonDecode(response.body)["loginResult"] == "Shipper Login") {
        user.save(username.text);
        user.retrieveUserName();
        Get.snackbar("Shipper Login SuccessFull", "Welcome",
            icon: const Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orangeAccent,
            borderRadius: 15,
            margin: const EdgeInsets.all(12),
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
            dismissDirection: DismissDirection.horizontal);
        Get.to(() => const MyBottomNavigation());
      }
    } else {
      Get.snackbar("Login Failed", "Try Again",
          icon: const Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orangeAccent,
          borderRadius: 15,
          margin: const EdgeInsets.all(12),
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          dismissDirection: DismissDirection.horizontal);
    }
  }

  void toggle() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
