import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ResetPasswordController extends GetxController {
  final _resetFrom = GlobalKey<FormState>();

  get rPKey => _resetFrom;
  final cPassword = TextEditingController();
  final nPassword = TextEditingController();
  bool isVisible = true;

  String? validateNewPassword(String value) {
    if (value.isEmpty) {
      return "Enter the New Password";
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Enter the New Password";
    } else if (value.length < 8) {
      return "Password should be 8 character";
    } else if (value != cPassword.text) {
      return "Password does not match";
    }
    return null;
  }

  void checkSave() {
    final isValid = _resetFrom.currentState!.validate();
    if (!isValid) {
      return;
    }
  }
}
