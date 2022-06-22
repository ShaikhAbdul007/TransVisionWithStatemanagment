import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/model/loading_list_model/refresh_on_load_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class LoadingListController extends GetxController {
  RxBool isVisible = false.obs;
  var loadingDataList = <MyLoadingList>[].obs;

  Future<List<MyLoadingList>> getLoadingDataApi() async {
    UserLoginDetails userLoginDetails = UserLoginDetails();
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/LoadingList?vesselname=DSUNNY&voyagename=D048&partycode=P1210"));
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
