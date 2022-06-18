import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommodityController extends GetxController {
  RxBool isVisible = false.obs;
  RxList<String> commodity = ['General', 'Hazardous', 'ODC'].obs;
  dynamic commodityValue;

  TextEditingController ourCassController = TextEditingController();
  TextEditingController unController = TextEditingController();

  toggle(value) {
    commodityValue = value;
    insertRow(value);
  }

  void insertRow(dynamic value) {
    if (value == "Hazardous") {
      isVisible.value = true;
    } else {
      isVisible.value = false;
    }
  }
}
