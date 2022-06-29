import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/s_do_slip_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class SDoSlip extends StatelessWidget {
  const SDoSlip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoSlip dController = Get.put(DoSlip());
    return Scaffold(
      appBar: AppBar(
        title: WeightText(
            color: AppColor.black, text: 'Delivery Order', size: 20.sp),
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
                    "assets/images/do.png",
                    fit: BoxFit.fill,
                    height: 250.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeightText(
                            text: "From Date",
                            size: 18.sp,
                            color: AppColor.textColor),
                        SizeBox.customHeight(8.h),
                        TextField(
                          controller: dController.doSlipFromDate,
                          decoration: InputDecoration(
                              hintText: "Select the date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  dController.chooseFromDate();
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              )),
                        ),
                        SizeBox.customHeight(10.h),
                        WeightText(
                            text: "To Date",
                            size: 18.sp,
                            color: AppColor.textColor),
                        SizeBox.customHeight(8.h),
                        TextField(
                          controller: dController.doSlipToDate,
                          decoration: InputDecoration(
                              hintText: "Select the date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  dController.chooseToDate();
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              )),
                        ),
                        SizeBox.customHeight(8.h),
                        WeightText(
                            text: "Reference No",
                            size: 18.sp,
                            color: AppColor.textColor),
                        SizeBox.customHeight(8.h),
                        TextFormField(
                          controller: dController.doSlipReference,
                          cursorColor: AppColor.black,
                          decoration: InputDecoration(
                              hintText: "Enter the Detials",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              )),
                        ),
                        SizeBox.customHeight(20.h),
                        Center(
                          child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2.sw,
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
                        SizeBox.customHeight(20.h),
                        SizedBox(
                            height: 500.h,
                            child: Obx(
                              () => dController.myDoList.isNotEmpty
                                  ? ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: dController.myDoList.length,
                                      itemBuilder: (context, index) {
                                        String bDate = dController
                                            .myDoList[index].bookingdate
                                            .toString();
                                        String dValidity = dController
                                            .myDoList[index].dovalidity
                                            .toString();
                                        return Card(
                                          shadowColor: Colors.orange,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.r))),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 12.w,
                                                left: 10.w,
                                                bottom: 5.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'DO No : ${dController.myDoList[index].doNo}',
                                                        size: 15.sp,
                                                        color: Colors.black),
                                                    SizeBox.customWidth(5.w),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    SizeBox.customWidth(5.w),
                                                    NormalText(
                                                        text:
                                                            'Bar Code : ${dController.myDoList[index].brcode}',
                                                        size: 15.sp,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Booking No : ${dController.myDoList[index].bookingno}',
                                                        size: 15.sp,
                                                        color: Colors.black),
                                                    SizeBox.customWidth(5.w),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    SizeBox.customWidth(5.w),
                                                    NormalText(
                                                        text:
                                                            'Booking Date : ${bDate.substring(0, 10)}',
                                                        size: 15.sp,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Port Of Loading :',
                                                        size: 15.sp,
                                                        color: Colors.black),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            '${dController.myDoList[index].pod}',
                                                        size: 15.sp,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Port Of Destination:',
                                                        size: 15.sp,
                                                        color: Colors.black),
                                                    SizeBox.customWidth(5.w),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            '${dController.myDoList[index].pol}',
                                                        size: 15.sp,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Ref No: ${dController.myDoList[index].refno}',
                                                        size: 15.sp,
                                                        color: Colors.black),
                                                    SizeBox.customWidth(5.w),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    SizeBox.customWidth(5.w),
                                                    NormalText(
                                                        text:
                                                            'Do Validity : ${dValidity.substring(0, 10)}',
                                                        size: 15.sp,
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
                                          size: 18.sp,
                                          color: AppColor.textColor),
                                    ),
                            ))
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
