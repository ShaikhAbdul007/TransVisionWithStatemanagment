import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/type/type_controller.dart';

class SizeController extends GetxController {
  TypeController typeController = Get.put(TypeController());
  dynamic selectedOption;

  List<dynamic> ourContainerSize = [20, 40];

  sizeUpdated(dynamic value) {
    selectedOption = value;
    typeController.getTypeApi(value);
  }
  @override
  void dispose() {
    super.dispose();
    selectedOption.dispose();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   typeController.getTypeApi(sizeUpdated);
  // }
}
