import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tranvision_customer_app/api_services/api_services.dart';
import 'package:tranvision_customer_app/api_services/pols_api.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_controller/destination_controller.dart';
import 'package:tranvision_customer_app/model/loading_model/loadingport.dart';

class LoadingController extends GetxController {
  DestinationController destinationConrtroller =
      Get.put(DestinationController());
  var loadingList = <Loadingport>[].obs;
  dynamic loadingPortValue;

  @override
  void onInit() {
    super.onInit();
    getLoadingPortApi();
  }

  Future<RxList<Loadingport>> getLoadingPortApi() async {
    final response = await http.get(Uri.parse(PolApi.polUrls));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loadingList.value = [];
      for (Map i in data) {
        loadingList.add(Loadingport.fromJson(i));
      }
      return loadingList;
    }
    return loadingList;
  }
}
