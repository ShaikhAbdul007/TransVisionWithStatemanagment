import 'package:get/get.dart';

class ConsigneeBottomController extends GetxController {
  var selectedIndex = 0.obs;

  void checkIndex(int index) {
    selectedIndex.value = index;
  }
}
