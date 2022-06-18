import 'dart:convert';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/api_services/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/icd_controller/newicdto_controller.dart';
import 'package:tranvision_customer_app/model/icd_model/icd_from.dart';

class IcdNewFromController extends GetxController {
  IcdNewToController icdToController = Get.put(IcdNewToController());
  var icdList = <Icdfrom>[].obs;
  dynamic icdFromValue;

  updatedIcdFromValue(dynamic value) {
    icdFromValue = value;
    icdToController.icdToValue = null;
    icdToController.fetchIcdToPort(value);
  }

  @override
  void onInit() {
    super.onInit();
    fetchIcdFromPort();
  }

  Future<List<Icdfrom>> fetchIcdFromPort() async {
    var response = await http.get(Uri.parse(ApiServices.icdFromUrls));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      icdList.value = [];
      for (Map i in data) {
        icdList.add(Icdfrom.fromJson(i));
      }

      return icdList;
    }
    return icdList;
  }
}
