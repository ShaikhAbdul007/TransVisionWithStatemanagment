import 'dart:convert';

import 'package:get/get.dart';
import 'package:tranvision_customer_app/api_services/api_services.dart';
import 'package:tranvision_customer_app/model/loading_model/destination_port.dart';
import 'package:http/http.dart' as http;

class DestinationController extends GetxController {
  var destinationList = <DestinationPort>[].obs;
  dynamic destinationValue;

  Future<RxList<DestinationPort>> getDestinationApi(dynamic value) async {
    final response =
        await http.get(Uri.parse(ApiServices.destinationUrl(value)));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      destinationList.value = [];
      for (Map i in data) {
        destinationList.add(DestinationPort.fromJson(i));
      }
      return destinationList;
    }
    return destinationList;
  }
}
