import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/booking_report_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class BookingReport extends StatelessWidget {
  const BookingReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportController reportController = Get.put(ReportController());
    return Scaffold(
      appBar: AppBar(
        title:
            WeightText(color: AppColor.black, text: 'Booking Report', size: 20),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/reports.png",
                    fit: BoxFit.fill,
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: reportController.reportKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WeightText(
                                  text: "From Date",
                                  size: 18,
                                  color: AppColor.textColor),
                              SizeBox.customHeight(8),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Select the Date";
                                  } else {
                                    return null;
                                  }
                                },
                                controller:
                                    reportController.reportSelectedFromDate,
                                decoration: InputDecoration(
                                    hintText: "Select the date",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        reportController.chooseFromDate();
                                      },
                                      icon: const Icon(
                                          Icons.calendar_month_outlined),
                                    )),
                              ),
                              SizeBox.customHeight(10),
                              WeightText(
                                  text: "To Date",
                                  size: 18,
                                  color: AppColor.textColor),
                              SizeBox.customHeight(8),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Select the Date";
                                  } else {
                                    return null;
                                  }
                                },
                                controller:
                                    reportController.reportSelectedToDate,
                                decoration: InputDecoration(
                                    hintText: "Select the date",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        reportController.chooseToDate();
                                      },
                                      icon: const Icon(
                                          Icons.calendar_month_outlined),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizeBox.customHeight(20),
                        InkWell(
                          onTap: () {
                            final isValid =
                                reportController.reportKey.currentState;
                            if (isValid!.validate()) {
                              showModalBottomSheet(
                                  context: Get.context!,
                                  builder: (context) =>
                                      buildRefreshOnLoadSheet(),
                                  useRootNavigator: true);
                            }
                          },
                          child: Center(
                            child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 2,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: BoldText(
                                  color: AppColor.black,
                                  text: 'Refresh',
                                  size: 18.0,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                              height: 500,
                              child: Obx(() => reportController
                                      .reportOnLoadList.isNotEmpty
                                  ? ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: reportController
                                          .reportOnLoadList.length,
                                      itemBuilder: (context, index) {
                                        String bDate = reportController
                                            .reportOnLoadList[index].bookingdate
                                            .toString();
                                        return Card(
                                          shadowColor: Colors.orange,
                                          elevation: 5,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0,
                                                bottom: 15.0,
                                                left: 15.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Reference No : ${reportController.reportOnLoadList[index].refno}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            'Bar Code : ${reportController.reportOnLoadList[index].brcode}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Booking No : ${reportController.reportOnLoadList[index].bookingno}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            'Booking Date : ${bDate.substring(0, 10)}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'DO No : ${reportController.reportOnLoadList[index].doNo}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    NormalText(
                                                        text:
                                                            'Quantity : ${reportController.reportOnLoadList[index].qty}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            'Size : ${reportController.reportOnLoadList[index].size}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Type : ${reportController.reportOnLoadList[index].type}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    NormalText(
                                                        text:
                                                            'Freight : ${reportController.reportOnLoadList[index].freight}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'POL : ${reportController.reportOnLoadList[index].pol}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            'POD : ${reportController.reportOnLoadList[index].pod}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Commodity: ${reportController.reportOnLoadList[index].commodity}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            'Weight : ${reportController.reportOnLoadList[index].weight}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'ICD From : ${reportController.reportOnLoadList[index].icdfrom}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            'ICD To : ${reportController.reportOnLoadList[index].icdto}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                                  : Center(
                                      child: SemiWeighText(
                                          text: "No Data Found",
                                          size: 18.0,
                                          color: AppColor.textColor),
                                    ))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

buildRefreshOnLoadSheet() {
  ReportController reportController = Get.find();
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
        height: 500,
        child: FutureBuilder(
            future: reportController.fetchreportonRefreshApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: reportController.reportOnRefreshList.length,
                    itemBuilder: (context, index) {
                      String bDate = snapshot.data[index].bookingdate;
                      return Card(
                        shadowColor: Colors.orange,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 15.0, left: 15.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  NormalText(
                                      text:
                                          'Booking No : ${snapshot.data[index].bookingno}',
                                      size: 15.0,
                                      color: Colors.black),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  NormalText(
                                      text:
                                          'Booking Date : ${bDate.substring(0, 10)}',
                                      size: 15.0,
                                      color: Colors.black),
                                ],
                              ),
                              Row(
                                children: [
                                  NormalText(
                                      text:
                                          'DO No : ${snapshot.data[index].doNo}',
                                      size: 15.0,
                                      color: Colors.black),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  NormalText(
                                      text:
                                          'Quantity : ${snapshot.data[index].qty}',
                                      size: 15.0,
                                      color: Colors.black),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  NormalText(
                                      text:
                                          'Size : ${snapshot.data[index].size}',
                                      size: 15.0,
                                      color: Colors.black),
                                ],
                              ),
                              Row(
                                children: [
                                  NormalText(
                                      text:
                                          'Type : ${snapshot.data[index].type}',
                                      size: 15.0,
                                      color: Colors.black),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  NormalText(
                                      text:
                                          'Freight : ${snapshot.data[index].freight}',
                                      size: 15.0,
                                      color: Colors.black),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  NormalText(
                                      text:
                                          'Weight : ${snapshot.data[index].weight}',
                                      size: 15.0,
                                      color: Colors.black),
                                ],
                              ),
                              Row(children: [
                                NormalText(
                                    text:
                                        'Reference No : ${snapshot.data[index].refno}',
                                    size: 15.0,
                                    color: Colors.black),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text:
                                        'Commodity: ${snapshot.data[index].commodity}',
                                    size: 15.0,
                                    color: Colors.black),
                              ]),
                              Row(
                                children: [
                                  NormalText(
                                      text: 'POL : ${snapshot.data[index].pol}',
                                      size: 15.0,
                                      color: Colors.black),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  NormalText(
                                      text: 'POD : ${snapshot.data[index].pod}',
                                      size: 15.0,
                                      color: Colors.black),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  NormalText(
                                      text:
                                          'ICD From : ${snapshot.data[index].icdfrom}',
                                      size: 15.0,
                                      color: Colors.black),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  NormalText(
                                      text:
                                          '	ICD To : ${snapshot.data[index].icdto}',
                                      size: 15.0,
                                      color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })),
  );
}

// buildRefreshOnLoadSheet() {
//   ReportController reportController = Get.find();
//   return Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: SizedBox(
//         height: 500,
//         child: Obx(() => reportController.reportOnRefreshList.isNotEmpty
//             ? ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: reportController.reportOnRefreshList.length,
//                 itemBuilder: (context, index) {
//                   String bDate = reportController
//                       .reportOnRefreshList[index].bookingdate
//                       .toString();
//                   return Card(
//                     shadowColor: Colors.orange,
//                     elevation: 5,
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(15))),
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 20.0, bottom: 15.0, left: 15.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'Reference No : ${reportController.reportOnRefreshList[index].refno}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'Bar Code : ${reportController.reportOnRefreshList[index].brcode}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'Booking No : ${reportController.reportOnRefreshList[index].bookingno}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'Booking Date : ${bDate.substring(0, 10)}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'DO No : ${reportController.reportOnRefreshList[index].doNo}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               NormalText(
//                                   text:
//                                       'Quantity : ${reportController.reportOnRefreshList[index].qty}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'Size : ${reportController.reportOnRefreshList[index].size}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'Type : ${reportController.reportOnRefreshList[index].type}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               NormalText(
//                                   text:
//                                       'Freight : ${reportController.reportOnRefreshList[index].freight}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               NormalText(
//                                   text:
//                                       'Freight : ${reportController.reportOnRefreshList[index].freight}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'POL : ${reportController.reportOnRefreshList[index].pol}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'POD : ${reportController.reportOnRefreshList[index].pod}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'Commodity: ${reportController.reportOnRefreshList[index].commodity}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'ICD From : ${reportController.reportOnRefreshList[index].icdfrom}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       '	ICD To : ${reportController.reportOnRefreshList[index].icdto}',
//                                   size: 15.0,
//                                   color: Colors.black),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 })
//             : Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Center(
//                   child: SemiWeighText(
//                       text: "No Data Found Please Check the Date range",
//                       size: 18.0,
//                       color: AppColor.textColor),
//                 ),
//               ))),
//   );
// }
