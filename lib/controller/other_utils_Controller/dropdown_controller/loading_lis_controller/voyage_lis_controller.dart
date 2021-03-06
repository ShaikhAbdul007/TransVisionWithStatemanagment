import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_services/loading_list_api.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/vessel_lis_controller.dart';
import 'package:tranvision_customer_app/model/loading_list_model/voyage_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';

class VoyageController extends GetxController {
  var voyageList = <Voyage>[].obs;
  dynamic selectedvalue;
  VesselController vesselController = Get.put(VesselController());
  UserLoginDetails userLoginDetails = UserLoginDetails();

  setValue(value) {
    selectedvalue = value;
  }

  Future<List<Voyage>> getVoyageApi(dynamic value) async {
    var username = userLoginDetails.retriveUserNameFromGetStrogare();
    final response = await http
        .get(Uri.parse(LoadingListApi.voyageUrl(username, value)))
        .timeout(const Duration(seconds: 15));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      voyageList.value = [];
      for (Map i in data) {
        voyageList.add(Voyage.fromJson(i));
      }
      return voyageList;
    }
    return voyageList;
  }

  // buildSheet() {
  //   Container(
  //     child: ListView.builder(
  //         itemCount: loadingDataList.length,
  //         itemBuilder: (context, index) {
  //           return ExpansionTile(
  //             title: Text(
  //               'Port : ${snapshot.data[index].port}'
  //               "   "
  //               'Size : ${snapshot.data[index].size}',
  //               style: const TextStyle(fontSize: 18.0),
  //             ),
  //             subtitle: Text(
  //               'FPOD : ${snapshot.data[index].fpod}'
  //               "   "
  //               "   "
  //               'Type: ${snapshot.data[index].type}',
  //               style: const TextStyle(fontSize: 15.0),
  //             ),
  //             leading: IconButton(
  //               icon: const Icon(Icons.edit),
  //               onPressed: () {},
  //             ),
  //             controlAffinity: ListTileControlAffinity.leading,
  //             trailing: Text(snapshot.data[index].container,
  //                 style: const TextStyle(fontSize: 15.0)),
  //             children: [
  //               Padding(
  //                 padding:
  //                     const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           child: Column(
  //                             children: [
  //                               const NormalText(
  //                                 text: "Weight",
  //                                 size: 12.0,
  //                                 color: Colors.black,
  //                               ),
  //                               TextField(
  //                                 expands: false,
  //                                 decoration: InputDecoration(
  //                                     hintText: snapshot.data[index].weight
  //                                         .toString(),
  //                                     border: OutlineInputBorder(
  //                                         borderSide: const BorderSide(
  //                                             width: 2.0,
  //                                             style: BorderStyle.solid,
  //                                             color: Colors.black),
  //                                         borderRadius:
  //                                             BorderRadius.circular(9))),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Expanded(
  //                           child: Column(
  //                             children: [
  //                               const NormalText(
  //                                 text: "IMCO",
  //                                 size: 12.0,
  //                                 color: Colors.black,
  //                               ),
  //                               TextField(
  //                                 expands: false,
  //                                 decoration: InputDecoration(
  //                                     hintText: snapshot.data[index].imco,
  //                                     border: OutlineInputBorder(
  //                                         borderSide: const BorderSide(
  //                                             width: 2.0,
  //                                             style: BorderStyle.solid,
  //                                             color: Colors.black),
  //                                         borderRadius:
  //                                             BorderRadius.circular(9))),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Expanded(
  //                           child: Column(
  //                             children: [
  //                               const NormalText(
  //                                 text: "Status",
  //                                 size: 12.0,
  //                                 color: Colors.black,
  //                               ),
  //                               TextField(
  //                                 expands: false,
  //                                 decoration: InputDecoration(
  //                                     hintText: snapshot.data[index].status,
  //                                     border: OutlineInputBorder(
  //                                         borderSide: const BorderSide(
  //                                             width: 2.0,
  //                                             style: BorderStyle.solid,
  //                                             color: Colors.black),
  //                                         borderRadius:
  //                                             BorderRadius.circular(9))),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           child: Column(
  //                             children: [
  //                               const NormalText(
  //                                 text: "STOW",
  //                                 size: 12.0,
  //                                 color: Colors.black,
  //                               ),
  //                               TextField(
  //                                 expands: false,
  //                                 decoration: InputDecoration(
  //                                     hintText: snapshot.data[index].stow,
  //                                     border: OutlineInputBorder(
  //                                         borderSide: const BorderSide(
  //                                             width: 2.0,
  //                                             style: BorderStyle.solid,
  //                                             color: Colors.black),
  //                                         borderRadius:
  //                                             BorderRadius.circular(9))),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Expanded(
  //                           child: Column(
  //                             children: [
  //                               const NormalText(
  //                                 text: "Remark",
  //                                 size: 12.0,
  //                                 color: Colors.black,
  //                               ),
  //                               TextField(
  //                                 expands: false,
  //                                 decoration: InputDecoration(
  //                                     hintText: snapshot.data[index].remark,
  //                                     border: OutlineInputBorder(
  //                                         borderSide: const BorderSide(
  //                                             width: 2.0,
  //                                             style: BorderStyle.solid,
  //                                             color: Colors.black),
  //                                         borderRadius:
  //                                             BorderRadius.circular(9))),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Expanded(
  //                           child: Column(
  //                             children: [
  //                               const NormalText(
  //                                 text: "Transportation",
  //                                 size: 12.0,
  //                                 color: Colors.black,
  //                               ),
  //                               TextField(
  //                                 expands: false,
  //                                 decoration: InputDecoration(
  //                                     hintText: snapshot.data[index].trans,
  //                                     border: OutlineInputBorder(
  //                                         borderSide: const BorderSide(
  //                                             width: 2.0,
  //                                             style: BorderStyle.solid,
  //                                             color: Colors.black),
  //                                         borderRadius:
  //                                             BorderRadius.circular(9))),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           );
  //         }),
  //   );}

}
