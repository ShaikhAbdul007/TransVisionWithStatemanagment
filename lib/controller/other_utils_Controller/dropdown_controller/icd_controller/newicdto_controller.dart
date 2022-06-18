import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_services/api_services.dart';
import 'package:tranvision_customer_app/model/icd_model/icd_to.dart';

class IcdNewToController extends GetxController {
  var icdToList = <Icdto>[].obs;
  dynamic icdToValue;

  // setValue(dynamic value) {
  //   icdToValue = value;
  // }

  Future<RxList<Icdto>> fetchIcdToPort(dynamic icdFrom) async {
    var response = await http.get(Uri.parse(ApiServices.icdToUrl(icdFrom)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      icdToList.value = [];
      for (Map i in data) {
        icdToList.add(Icdto.fromJson(i));
      }
      return icdToList;
    }
    return icdToList;
  }
}
