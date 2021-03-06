import 'dart:convert';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tranvision_customer_app/api_services/login_api.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';
import 'package:tranvision_customer_app/utils/component/consignee_bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class LoginController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = true.obs;
  UserLoginDetails user = UserLoginDetails();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  Future<dynamic> checkLogin() async {
    final isValid = formKey.currentState;
    try {
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
          } else if (jsonDecode(response.body)["loginResult"] ==
              "Shipper Login") {
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
                icon:
                    const Icon(Icons.person_add_disabled, color: Colors.white),
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
        }
      }
    } on SocketException {
      return Get.snackbar("No Internet", "",
          messageText: SemiWeighText(
              text: "No Internet", size: 18.sp, color: AppColor.textColor),
          icon: const Icon(
              Icons.signal_cellular_connected_no_internet_0_bar_rounded,
              color: Colors.white),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.orangeAccent,
          borderRadius: 15.r,
          margin: EdgeInsets.all(12.r),
          colorText: AppColor.textColor,
          duration: const Duration(seconds: 2),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          dismissDirection: DismissDirection.horizontal);
    } on HttpException {
      return Future.error("Server Error");
    }
  }

  void toggle() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
