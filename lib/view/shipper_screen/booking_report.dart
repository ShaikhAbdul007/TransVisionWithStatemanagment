import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: WeightText(
            color: AppColor.black, text: 'Booking Report', size: 20.sp),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/reports.png",
                fit: BoxFit.fill,
                height: 250.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
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
                              size: 18.sp,
                              color: AppColor.textColor),
                          SizeBox.customHeight(8.h),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Select the Date";
                              } else {
                                return null;
                              }
                            },
                            controller: reportController.reportSelectedFromDate,
                            decoration: InputDecoration(
                                hintText: "Select the date",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    reportController.chooseFromDate();
                                  },
                                  icon:
                                      const Icon(Icons.calendar_month_outlined),
                                )),
                          ),
                          SizeBox.customHeight(10.h),
                          WeightText(
                              text: "To Date",
                              size: 18.sp,
                              color: AppColor.textColor),
                          SizeBox.customHeight(8.h),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Select the Date";
                              } else {
                                return null;
                              }
                            },
                            controller: reportController.reportSelectedToDate,
                            decoration: InputDecoration(
                                hintText: "Select the date",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    reportController.chooseToDate();
                                  },
                                  icon:
                                      const Icon(Icons.calendar_month_outlined),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizeBox.customHeight(20.h),
                    InkWell(
                      onTap: () {
                        final isValid = reportController.reportKey.currentState;
                        if (isValid!.validate()) {
                          showModalBottomSheet(
                              context: Get.context!,
                              builder: (context) => buildRefreshOnLoadSheet(),
                              useRootNavigator: true);
                        }
                      },
                      child: Center(
                        child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: BoldText(
                              color: AppColor.black,
                              text: 'Refresh',
                              size: 18.sp,
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.r),
                      child: SizedBox(
                          height: 500.h,
                          child: Obx(() => reportController
                                  .reportOnLoadList.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      reportController.reportOnLoadList.length,
                                  itemBuilder: (context, index) {
                                    String bDate = reportController
                                        .reportOnLoadList[index].bookingdate
                                        .toString();
                                    return Card(
                                      shadowColor: Colors.orange,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.r))),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.h,
                                            bottom: 15.h,
                                            left: 15.w),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'Reference No : ${reportController.reportOnLoadList[index].refno}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                SizeBox.customWidth(5.w),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Bar Code : ${reportController.reportOnLoadList[index].brcode}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'Booking No : ${reportController.reportOnLoadList[index].bookingno}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                SizeBox.customWidth(5.w),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Booking Date : ${bDate.substring(0, 10)}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'DO No : ${reportController.reportOnLoadList[index].doNo}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                SizeBox.customWidth(5.w),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                SizeBox.customWidth(5.w),
                                                NormalText(
                                                    text:
                                                        'Quantity : ${reportController.reportOnLoadList[index].qty}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                SizeBox.customWidth(5.w),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Size : ${reportController.reportOnLoadList[index].size}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'Type : ${reportController.reportOnLoadList[index].type}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                SizeBox.customWidth(5.w),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                SizeBox.customWidth(5.w),
                                                NormalText(
                                                    text:
                                                        'Freight : ${reportController.reportOnLoadList[index].freight}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'POL : ${reportController.reportOnLoadList[index].pol}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                SizeBox.customWidth(5.w),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'POD : ${reportController.reportOnLoadList[index].pod}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                SizeBox.customWidth(5.w),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'Commodity: ${reportController.reportOnLoadList[index].commodity}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Weight : ${reportController.reportOnLoadList[index].weight}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'ICD From : ${reportController.reportOnLoadList[index].icdfrom}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                SizeBox.customWidth(5.w),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'ICD To : ${reportController.reportOnLoadList[index].icdto}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            SizeBox.customHeight(10.h),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: InkWell(
                                                onTap: () => Get.defaultDialog(
                                                  buttonColor: AppColor.primary,
                                                  title: "Booking Report PDF",
                                                  content: Column(
                                                    children: const [
                                                      Text(
                                                          "You want To Share ?")
                                                    ],
                                                  ),
                                                  barrierDismissible: false,
                                                  actions: [
                                                    ElevatedButton.icon(
                                                        onPressed: () {},
                                                        icon: const Icon(Icons
                                                            .thumb_up_sharp),
                                                        label: const Text(
                                                            "Confirm")),
                                                    ElevatedButton.icon(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        icon: const Icon(Icons
                                                            .thumb_down_sharp),
                                                        label: const Text(
                                                            "Cancel"))
                                                  ],
                                                ),
                                                child: Container(
                                                    width: 100.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        10.r),
                                                                bottom: Radius
                                                                    .circular(
                                                                        10.r)),
                                                        color:
                                                            AppColor.primary),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(Icons.share),
                                                        SizeBox.customWidth(
                                                            3.w),
                                                        SemiWeighText(
                                                            text: "Share",
                                                            size: 13.sp,
                                                            color:
                                                                AppColor.black),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                              : Center(
                                  child: SemiWeighText(
                                      text: "No Data Found",
                                      size: 18.sp,
                                      color: AppColor.textColor),
                                ))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

buildRefreshOnLoadSheet() {
  ReportController reportController = Get.find();
  return Padding(
    padding: EdgeInsets.all(10.r),
    child: SizedBox(
        height: 500.h,
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
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, bottom: 15.h, left: 15.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  NormalText(
                                      text:
                                          'Booking No : ${snapshot.data[index].bookingno}',
                                      size: 13.sp,
                                      color: Colors.black),
                                  SizeBox.customWidth(5.w),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  NormalText(
                                      text:
                                          'Booking Date : ${bDate.substring(0, 10)}',
                                      size: 13.sp,
                                      color: Colors.black),
                                ],
                              ),
                              Row(
                                children: [
                                  NormalText(
                                      text:
                                          'DO No : ${snapshot.data[index].doNo}',
                                      size: 13.sp,
                                      color: Colors.black),
                                  SizeBox.customWidth(5.w),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  SizeBox.customWidth(5.w),
                                  NormalText(
                                      text:
                                          'Quantity : ${snapshot.data[index].qty}',
                                      size: 13.sp,
                                      color: Colors.black),
                                  SizeBox.customWidth(5.w),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  NormalText(
                                      text:
                                          'Size : ${snapshot.data[index].size}',
                                      size: 13.sp,
                                      color: Colors.black),
                                ],
                              ),
                              Row(
                                children: [
                                  NormalText(
                                      text:
                                          'Type : ${snapshot.data[index].type}',
                                      size: 13.sp,
                                      color: Colors.black),
                                  SizeBox.customWidth(5.w),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  SizeBox.customWidth(5.w),
                                  NormalText(
                                      text:
                                          'Freight : ${snapshot.data[index].freight}',
                                      size: 13.sp,
                                      color: Colors.black),
                                  SizeBox.customWidth(5.w),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  SizeBox.customWidth(5.w),
                                  NormalText(
                                      text:
                                          'Weight : ${snapshot.data[index].weight}',
                                      size: 13.sp,
                                      color: Colors.black),
                                ],
                              ),
                              Row(children: [
                                NormalText(
                                    text:
                                        'Reference No : ${snapshot.data[index].refno}',
                                    size: 13.sp,
                                    color: Colors.black),
                                SizeBox.customWidth(5.w),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text:
                                        'Commodity: ${snapshot.data[index].commodity}',
                                    size: 13.sp,
                                    color: Colors.black),
                              ]),
                              Row(
                                children: [
                                  NormalText(
                                      text: 'POL : ${snapshot.data[index].pol}',
                                      size: 13.sp,
                                      color: Colors.black),
                                  SizeBox.customWidth(5.w),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  NormalText(
                                      text: 'POD : ${snapshot.data[index].pod}',
                                      size: 13.sp,
                                      color: Colors.black),
                                  SizeBox.customWidth(5.w),
                                ],
                              ),
                              Row(
                                children: [
                                  NormalText(
                                      text:
                                          'ICD From : ${snapshot.data[index].icdfrom}',
                                      size: 13.sp,
                                      color: Colors.black),
                                  SizeBox.customWidth(5.w),
                                  const Icon(Icons.arrow_right_alt_outlined),
                                  NormalText(
                                      text:
                                          '	ICD To : ${snapshot.data[index].icdto}',
                                      size: 13.sp,
                                      color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SemiWeighText(
                  text: "Waiting...",
                  color: AppColor.textColor,
                  size: 13.sp,
                ));
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Center(
                    child: SemiWeighText(
                  text: "Can't Connect to Server...",
                  color: AppColor.textColor,
                  size: 13.sp,
                ));
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
//                           top: 20.0, bottom: 13.sp, left: 13.sp),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'Reference No : ${reportController.reportOnRefreshList[index].refno}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'Bar Code : ${reportController.reportOnRefreshList[index].brcode}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'Booking No : ${reportController.reportOnRefreshList[index].bookingno}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'Booking Date : ${bDate.substring(0, 10)}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'DO No : ${reportController.reportOnRefreshList[index].doNo}',
//                                   size: 13.sp,
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
//                                   size: 13.sp,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'Size : ${reportController.reportOnRefreshList[index].size}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'Type : ${reportController.reportOnRefreshList[index].type}',
//                                   size: 13.sp,
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
//                                   size: 13.sp,
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
//                                   size: 13.sp,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'POL : ${reportController.reportOnRefreshList[index].pol}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'POD : ${reportController.reportOnRefreshList[index].pod}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       'Commodity: ${reportController.reportOnRefreshList[index].commodity}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               NormalText(
//                                   text:
//                                       'ICD From : ${reportController.reportOnRefreshList[index].icdfrom}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Icon(Icons.arrow_right_alt_outlined),
//                               NormalText(
//                                   text:
//                                       '	ICD To : ${reportController.reportOnRefreshList[index].icdto}',
//                                   size: 13.sp,
//                                   color: Colors.black),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 })
//             : Padding(
//                 padding: const EdgeInsets.all(13.sp),
//                 child: Center(
//                   child: SemiWeighText(
//                       text: "No Data Found Please Check the Date range",
//                       size: 18.0,
//                       color: AppColor.textColor),
//                 ),
//               ))),
//   );
// }
