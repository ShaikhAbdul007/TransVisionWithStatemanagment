import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/authController/loginController.dart';

import '../shared_preferences/shared_preference.dart';

class ApiServices {
  static String consigneeLoginUrl() {
    UserLoginDetails user = UserLoginDetails();
    var username = user.retrieveUserName();
    final String consigneeProfileApi =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/consigneedata?username=$username";
    return consigneeProfileApi;
  }

  static String loginUrl() {
    LoginController loginController = Get.find();
    final String loginApi =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/login?username=" +
            loginController.username.text +
            "&password=" +
            loginController.password.text;
    return loginApi;
  }
}
