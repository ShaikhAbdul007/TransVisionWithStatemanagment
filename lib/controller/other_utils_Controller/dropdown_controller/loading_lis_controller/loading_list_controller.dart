import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_services/loading_list_api.dart';
import 'package:tranvision_customer_app/app_exception/exception.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/vessel_lis_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/voyage_lis_controller.dart';
import 'package:tranvision_customer_app/model/loading_list_model/loading_list_update_.dart';
import 'package:tranvision_customer_app/model/loading_list_model/refresh_on_load_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class LoadingListController extends GetxController {
  UserLoginDetails userLoginDetails = UserLoginDetails();
  // RxBool ourEditOn = true.obs;
  var loadingDataList = <MyLoadingList>[].obs;
  RxList loadingListUpdate = <LoadingListUpdate>[].obs;
  VesselController vesselController = Get.put(VesselController());
  VoyageController voyageController = Get.put(VoyageController());
  final remarkController = TextEditingController();
  final weightController = TextEditingController();
  final imcoController = TextEditingController();
  final statusController = TextEditingController();
  final transpotationController = TextEditingController();
  final stowController = TextEditingController();

  @override
  void onInit() {
    getLoadingDataApi();
    super.onInit();
  }

  Future<List<MyLoadingList>> getLoadingDataApi() async {
    try {
      var username = userLoginDetails.retriveUserNameFromGetStrogare();
      final response = await http
          .get(Uri.parse(LoadingListApi.loadingListUrl(username,
              vesselController.vesselNewValue, voyageController.selectedvalue)))
          .timeout(const Duration(seconds: 15));
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
    } catch (e) {
      throw FetchDataException("Exception Occurred");
    }
  }

  addListItem(data) {
    loadingListUpdate.add(LoadingListUpdate.fromJson(data));
  }

  Future<int> updatePostData(data) async {
    // var body = List<Map<String, dynamic>>.from(
    //     loadingListUpdate.map((element) => element.toJson()));
    var temp = <LoadingListUpdate>[];

    temp.add(LoadingListUpdate.fromJson(data));

    var body = List<Map<String, dynamic>>.from(
        temp.map((element) => element.toJson()));

    var response =
        await http.post(Uri.parse((LoadingListApi.loadingListUpdateUrl())),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      // return BookingResDataModel.fromJson(data);
      print(data);
      return data[0]["result"];
    } else {
      throw Exception('Api Failed');
    }
  }

  // toggle(int index) {
  //   ourEditOn.value = !ourEditOn.value;
  // }

  // @override
  // void dispose() {
  //   remarkController.dispose();
  //   weightController.dispose();
  //   imcoController.dispose();
  //   statusController.dispose();
  //   transpotationController.dispose();
  //   stowController.dispose();
  //   super.dispose();
  // }

}
