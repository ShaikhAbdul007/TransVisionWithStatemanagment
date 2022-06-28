import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_services/bill_summary_api.dart';
import 'package:tranvision_customer_app/model/bill_summary_model/summary_on_load_model.dart';
import 'package:tranvision_customer_app/model/bill_summary_model/summarywithnewdate.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class BillSummaryController extends GetxController {
  var dateSelected = DateTime.now().obs;
  var billSumFormDate = TextEditingController();
  var billSumToDate = TextEditingController();
  final myOurKey = GlobalKey<FormState>();
  UserLoginDetails user = UserLoginDetails();
  var myList = <SummaryOnLoad>[].obs;
  var newListWithDate = <BillSummaryRefreshWithDate>[].obs;
  // var toDateSelected = DateTime.now().obs;
  // var myListWithDate = <Summarywithnewdate>[].obs;

  @override
  void onInit() {
    getSummaryOnLoadApi();
    super.onInit();
  }

  chooseFromDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: dateSelected.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String billFormatDateFrom = DateFormat('yyyy-MM-dd').format(pickedDate);
      billSumFormDate.text = billFormatDateFrom;
    } else {
      return null;
    }
  }

  chooseToDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: dateSelected.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));
    if (pickedDate != null) {
      String billFormatDateTo = DateFormat('yyyy-MM-dd').format(pickedDate);
      billSumToDate.text = billFormatDateTo;
    }
  }

  Future<List<SummaryOnLoad>> getSummaryOnLoadApi() async {
    var username = user.retriveUserNameFromGetStrogare();
    final response =
        await http.get(Uri.parse(BillSummaryApi.billSummaryUrl(username)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      myList.value = [];
      for (Map i in data) {
        myList.add(SummaryOnLoad.fromJson(i));
      }
      return myList;
    }
    return myList;
  }

  Future<RxList<BillSummaryRefreshWithDate>>
      fetchSummaryOnLoadWithDate() async {
    var username = user.retriveUserNameFromGetStrogare();
    final response = await http.get(Uri.parse(BillSummaryApi.billSummaryDateUrl(
        username, billSumFormDate.text, billSumToDate.text)));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      newListWithDate.value = [];
      for (Map i in data) {
        newListWithDate.add(BillSummaryRefreshWithDate.fromJson(i));
      }
    }
    return newListWithDate;
  }

  // ourBuildSheet() {
  //   return Container(
  //       height: 500,
  //       padding: const EdgeInsets.all(2),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(9),
  //       ),
  //       child: Obx(() => newListWithDate.isNotEmpty
  //           ? ListView.builder(
  //               scrollDirection: Axis.vertical,
  //               itemCount: newListWithDate.length,
  //               itemBuilder: (context, index) {
  //                 String newBilldate =
  //                     newListWithDate[index].billdate.toString();
  //                 String newBlDate = newListWithDate[index].bldate.toString();
  //                 return Padding(
  //                   padding: const EdgeInsets.all(5.0),
  //                   child: Card(
  //                     shadowColor: Colors.orange,
  //                     elevation: 5,
  //                     shape: const RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15))),
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 15.0, left: 10, bottom: 5.0),
  //                       child: Column(
  //                         children: [
  //                           Row(
  //                             children: [
  //                               NormalText(
  //                                   text:
  //                                       'Vessel : ${newListWithDate[index].vesselname}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                               const Icon(Icons.arrow_right_alt_outlined),
  //                               NormalText(
  //                                   text:
  //                                       'Voyage : ${newListWithDate[index].voyage}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               NormalText(
  //                                   text:
  //                                       'Invoice No : ${newListWithDate[index].billno}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                               const Icon(Icons.arrow_right_alt_outlined),
  //                               NormalText(
  //                                   text:
  //                                       'Invoice Date : ${newBilldate.substring(0, 10)}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               NormalText(
  //                                   text:
  //                                       'BL No :  ${myList[index].blno.toString()}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                               const Icon(Icons.arrow_right_alt_outlined),
  //                               NormalText(
  //                                   text:
  //                                       'Bl Date: ${newBlDate.substring(0, 10)}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               const NormalText(
  //                                   text: 'Total Amount : ',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                               const Icon(Icons.arrow_right_alt_outlined),
  //                               NormalText(
  //                                   text:
  //                                       '${newListWithDate[index].billtotals}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               const NormalText(
  //                                   text: 'Payment Amount : ',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                               const Icon(Icons.arrow_right_alt_outlined),
  //                               NormalText(
  //                                   text: '${newListWithDate[index].payamt}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               const NormalText(
  //                                   text: 'Balance Amount : ',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                               const Icon(Icons.arrow_right_alt_outlined),
  //                               NormalText(
  //                                   text: '${newListWithDate[index].balamt}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               const NormalText(
  //                                   text: 'TDS Amount : ',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                               const Icon(Icons.arrow_right_alt_outlined),
  //                               NormalText(
  //                                   text: '${newListWithDate[index].tdsamt}',
  //                                   size: 15.0,
  //                                   color: Colors.black),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               })
  //           : Center(
  //               child: Padding(
  //               padding: const EdgeInsets.all(15.0),
  //               child: SemiWeighText(
  //                   text: "No Data Found please check the date range",
  //                   size: 18.0,
  //                   color: AppColor.textColor),
  //             ))));
  // }

  buildSheet() {
    return Container(
        height: 500,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
        ),
        child: FutureBuilder(
            future: fetchSummaryOnLoadWithDate(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: newListWithDate.length,
                    itemBuilder: (context, index) {
                      String invoiceDate = snapshot.data[index].billdate;
                      String billDate = snapshot.data[index].bldate;
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          shadowColor: Colors.orange,
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 10, bottom: 5.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    NormalText(
                                        text:
                                            'Vessel : ${snapshot.data[index].vesselname}',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            'Voyage : ${snapshot.data[index].voyage}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    NormalText(
                                        text:
                                            'Invoice No : ${snapshot.data[index].billno.toString()}',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            'Invoice Date : ${invoiceDate.substring(0, 10)}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    NormalText(
                                        text:
                                            'BL No : ${snapshot.data[index].blno.toString()}',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            'Bl Date: ${billDate.substring(0, 10)}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const NormalText(
                                        text: 'Total Amount : ',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            '${snapshot.data[index].billtotals}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const NormalText(
                                        text: 'Payment Amount : ',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text: snapshot.data[index].payamt
                                            .toString(),
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const NormalText(
                                        text: 'Balance Amount : ',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text: snapshot.data[index].balamt
                                            .toString(),
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const NormalText(
                                        text: 'TDS Amount : ',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text: snapshot.data[index].tdsamt
                                            .toString(),
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: NormalText(
                      text: "No Record Found\nPlease Select Proper Date",
                      size: 12.0,
                      color: Colors.black),
                );
              }
            }));
  }
}

  // Future<List<Summarywithnewdate>> getSummaryOnLoadApiWithDate() async {
  //   var username = user.retriveUserNameFromGetStrogare();
  //   final response = await http.get(Uri.parse(BillSummaryApi.billSummaryDateUrl(
  //       username, billSumFormDate, billSumToDate)));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     myListWithDate.value = [];
  //     for (Map i in data) {
  //       myListWithDate.add(Summarywithnewdate.fromJson(i));
  //     }
  //     return myListWithDate;
  //   }
  //   return myListWithDate;
  // }

  // Future<List<Summarywithnewdate>> fetchSummaryOnLoadWithDate() async {
  //   var username = user.retriveUserNameFromGetStrogare();
  //   final response = await http.get(Uri.parse(
  //       BillOfLaddingApi.billOfLaddingOnRefresh(
  //           username, billSumFormDate, billSumToDate)));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     newListWithDate.value = [];
  //     for (Map i in data) {
  //       newListWithDate.add(Summarywithnewdate.fromJson(i));
  //     }
  //   }
  //   return newListWithDate;
  // }