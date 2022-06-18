// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:tranvision_customer_app/api_services/api_services.dart';
// import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_Controller/icdController/icdToController.dart';

// import 'package:http/http.dart' as http;
// import 'package:tranvision_customer_app/model/icd_model/icd_from.dart';

// class IcdFromController extends GetxController {
//   IcdToController icdToController = Get.put(IcdToController());
//   final icdFromList = <Icdfrom>[].obs;
//   final icdFromValue = "".obs;

//   updatedIcdFromValue(dynamic icdFromValue) {
//     icdFromValue.value = icdFromValue;

//     icdToController.fetchIcdToPort(icdFromValue);
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     fetchIcdFromPort();
//   }

//   Future<RxList<Icdfrom>> fetchIcdFromPort() async {
//     var response = await http.get(Uri.parse(ApiServices.icdFromUrls));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       icdFromList.value = [];
//       for (Map i in data) {
//         icdFromList.add(Icdfrom.fromJson(i));
//       }
//       return icdFromList;
//     }
//     return icdFromList;
//   }
// }
