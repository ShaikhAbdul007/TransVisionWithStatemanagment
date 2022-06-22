import 'dart:convert';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/voyage_lis_controller.dart';
import 'package:tranvision_customer_app/model/loading_list_model/vessel_model.dart';

class VesselController extends GetxController {
  VoyageController voyageController = Get.put(VoyageController());
  var vesselList = <Newvessel>[].obs;
  dynamic vesselNewValue;

  @override
  void onInit() {
    super.onInit();
    getVesselApi();
  }

  Future<List<Newvessel>> getVesselApi() async {
    final response = await http.get(Uri.parse(
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/vesselname?partycode=P1210"));
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

  notifyUpdated(dynamic value) {
    vesselNewValue = value;
    voyageController.getVoyageApi(value);
  }
}
