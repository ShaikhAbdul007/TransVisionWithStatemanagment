import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:tranvision_customer_app/api_services/loading_list_api.dart';
import 'package:tranvision_customer_app/model/loading_list_model/vessel_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class VesselController extends GetxController {
  var vesselList = <Newvessel>[].obs;
  dynamic vesselNewValue;
  UserLoginDetails userLoginDetails = UserLoginDetails();

  @override
  void onInit() {
    super.onInit();
    getVesselApi();
  }

  Future<List<Newvessel>> getVesselApi() async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response = await http
        .get(Uri.parse(LoadingListApi.vesselUrl(username)))
        .timeout(const Duration(seconds: 15));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      vesselList.value = [];
      for (Map i in data) {
        vesselList.add(Newvessel.fromJson(i));
      }
      return vesselList;
    }
    return vesselList;
  }
}
