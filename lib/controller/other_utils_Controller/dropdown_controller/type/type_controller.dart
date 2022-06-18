import 'dart:convert';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/api_services/api_services.dart';
import 'package:tranvision_customer_app/model/type_model/type.dart';
import 'package:http/http.dart' as http;

class TypeController extends GetxController {
  var typeList = <TypeModel>[].obs;
  dynamic selectedtype;

  Future<RxList<TypeModel>> getTypeApi(dynamic value) async {
    final response = await http.get(Uri.parse(ApiServices.typeUrl(value)));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      typeList.value = [];
      for (Map i in data) {
        typeList.add(TypeModel.fromJson(i));
      }
      return typeList;
    }
    return typeList;
  }
}
