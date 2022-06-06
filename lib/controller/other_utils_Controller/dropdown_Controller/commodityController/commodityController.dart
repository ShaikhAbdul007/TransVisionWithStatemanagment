import 'package:get/get.dart';

class CommodityController extends GetxController {
  RxBool isVisible = false.obs ;


  void insertRow(dynamic value) {
    if (value == "Hazardous") {
      isVisible.value = true;
    } else {
      isVisible.value = false;
    }
  }
}
