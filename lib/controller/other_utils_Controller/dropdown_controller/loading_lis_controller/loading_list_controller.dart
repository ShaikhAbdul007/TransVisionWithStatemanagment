import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_services/loading_list_api.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/vessel_lis_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/voyage_lis_controller.dart';
import 'package:tranvision_customer_app/model/loading_list_model/refresh_on_load_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class LoadingListController extends GetxController {
  UserLoginDetails userLoginDetails = UserLoginDetails();
  RxBool isVisible = false.obs;
  var loadingDataList = <MyLoadingList>[].obs;
  VesselController vesselController = Get.put(VesselController());
  VoyageController voyageController = Get.put(VoyageController());

  Future<List<MyLoadingList>> getLoadingDataApi() async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response = await http.get(Uri.parse(LoadingListApi.loadingListUrl(
        username,
        vesselController.vesselNewValue,
        voyageController.selectedvalue)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      loadingDataList.value = [];
      for (Map i in data) {
        loadingDataList.add(MyLoadingList.fromJson(i));
      }
      return loadingDataList;
    } else {
      throw Exception("Api Loading Failed");
    }
  }

  bool toggle() {
    isVisible.value = true;
    return true;
  }
}
