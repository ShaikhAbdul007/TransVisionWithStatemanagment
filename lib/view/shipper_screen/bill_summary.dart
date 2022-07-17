import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/bill_summary_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class BillSummary extends StatelessWidget {
  const BillSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height / 13;
    // final width = MediaQuery.of(context).size.width;
    BillSummaryController bController = Get.put(BillSummaryController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: WeightText(
            color: AppColor.black, text: 'Bill Summary', size: 20.sp),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/bill.png",
                fit: BoxFit.fill,
                height: 250.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 10.w),
                child: Column(
                  children: [
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: bController.myOurKey,
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
                                return "Please Select date";
                              } else {
                                return null;
                              }
                            },
                            controller: bController.billSumFormDate,
                            decoration: InputDecoration(
                                hintText: "Select the date",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    bController.chooseFromDate();
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
                                return "Please Select date";
                              } else {
                                return null;
                              }
                            },
                            controller: bController.billSumToDate,
                            decoration: InputDecoration(
                                hintText: "Select the date",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    bController.chooseToDate();
                                  },
                                  icon:
                                      const Icon(Icons.calendar_month_outlined),
                                )),
                          ),
                          SizeBox.customHeight(8.h),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: InkWell(
                        onTap: () {
                          final isValid = bController.myOurKey.currentState;
                          if (isValid!.validate()) {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: Get.context!,
                                builder: (context) => bController.buildSheet());
                          }
                        },
                        child: Center(
                          child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 1.2,
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
                    ),
                    Container(
                        height: 500.h,
                        padding: EdgeInsets.all(1.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.r),
                        ),
                        child: Obx(() => bController.myList.isNotEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: bController.myList.length,
                                itemBuilder: (context, index) {
                                  String invoiceDate = bController
                                      .myList[index].billdate
                                      .toString();
                                  String billDate = bController
                                      .myList[index].bldate
                                      .toString();
                                  return Padding(
                                    padding: EdgeInsets.all(5.r),
                                    child: Card(
                                      shadowColor: Colors.orange,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.r))),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.h, left: 10.w, bottom: 5.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                NormalText(
                                                    text: 'BL Date:',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text: billDate.substring(
                                                        0, 10),
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text: 'Invoice Date :',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text: invoiceDate.substring(
                                                        0, 10),
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'BL No : ${bController.myList[index].blno.toString()}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Invoice No: ${bController.myList[index].billno.toString()}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text: 'Vessel : ',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        '${bController.myList[index].vesselname}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text: 'Voyage : ',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        '${bController.myList[index].voyage}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text: 'Total Amount : ',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        '${bController.myList[index].billtotals}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text: 'Payment Amount : ',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        '${bController.myList[index].payamt}',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text: 'Balance Amount : ',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text: bController
                                                        .myList[index].balamt
                                                        .toString(),
                                                    size: 13.sp,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text: 'TDS Amount : ',
                                                    size: 13.sp,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text: bController
                                                        .myList[index].tdsamt
                                                        .toString(),
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
                                                  title: "Bill Summary PDF",
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
                                                            size: 15.sp,
                                                            color:
                                                                AppColor.black),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : Padding(
                                padding: EdgeInsets.only(top: 200.h),
                                child: SemiWeighText(
                                    text:
                                        " Please wait while fetching the details",
                                    size: 13.sp,
                                    color: AppColor.textColor))))
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
