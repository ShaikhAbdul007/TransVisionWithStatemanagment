import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';

class AllToast {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.orange,
        fontSize: 20);
  }

  static void showsnackBarErrorMessage(
      String message, IconData icons, Color color, Duration duration) {
    Get.snackbar(message, message,
        messageText: Text(message),
        showProgressIndicator: true,
        icon: Icon(icons),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.error,
        borderRadius: 15.r,
        colorText: color,
        duration: duration,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        dismissDirection: DismissDirection.vertical);
  }
}
