import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/consigneController/damage_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class DamageInvoice extends StatelessWidget {
  const DamageInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DamageController damageController = Get.put(DamageController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            WeightText(color: AppColor.black, text: 'Damage Invoice', size: 20),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Column(
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
                      controller: damageController.damageFromDate,
                      decoration: InputDecoration(
                          hintText: "Select the date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              damageController.chooseFromDate();
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
                      controller: damageController.damageToDate,
                      decoration: InputDecoration(
                          hintText: "Select the date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              damageController.chooseToDate();
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
                      controller: damageController.damageReference,
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
                          width: MediaQuery.of(context).size.width / 2.w,
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
                    // SizedBox(
                    //     height: 500,
                    //     child: Obx(
                    //       () => dController.myDoList.isNotEmpty
                    //           ? ListView.builder(
                    //               scrollDirection: Axis.vertical,
                    //               itemCount: dController.myDoList.length,
                    //               itemBuilder: (context, index) {
                    //                 String bDate = dController
                    //                     .myDoList[index].bookingdate
                    //                     .toString();
                    //                 String dValidity = dController
                    //                     .myDoList[index].dovalidity
                    //                     .toString();
                    //                 return Card(
                    //                   shadowColor: Colors.orange,
                    //                   elevation: 5,
                    //                   shape: const RoundedRectangleBorder(
                    //                       borderRadius: BorderRadius.all(
                    //                           Radius.circular(15))),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.only(
                    //                         top: 12, left: 10, bottom: 5),
                    //                     child: Column(
                    //                       children: [
                    //                         Row(
                    //                           children: [
                    //                             NormalText(
                    //                                 text:
                    //                                     'DO No : ${dController.myDoList[index].doNo}',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                             const SizedBox(
                    //                               width: 5,
                    //                             ),
                    //                             const Icon(Icons
                    //                                 .arrow_right_alt_outlined),
                    //                             const SizedBox(
                    //                               width: 5,
                    //                             ),
                    //                             NormalText(
                    //                                 text:
                    //                                     'Bar Code : ${dController.myDoList[index].brcode}',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                           ],
                    //                         ),
                    //                         Row(
                    //                           children: [
                    //                             NormalText(
                    //                                 text:
                    //                                     'Booking No : ${dController.myDoList[index].bookingno}',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                             const SizedBox(
                    //                               width: 5,
                    //                             ),
                    //                             const Icon(Icons
                    //                                 .arrow_right_alt_outlined),
                    //                             const SizedBox(
                    //                               width: 5,
                    //                             ),
                    //                             NormalText(
                    //                                 text:
                    //                                     'Booking Date : ${bDate.substring(0, 10)}',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                           ],
                    //                         ),
                    //                         Row(
                    //                           children: [
                    //                             const NormalText(
                    //                                 text:
                    //                                     'Port Of Loading :',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                             const SizedBox(
                    //                               width: 5,
                    //                             ),
                    //                             const Icon(Icons
                    //                                 .arrow_right_alt_outlined),
                    //                             NormalText(
                    //                                 text:
                    //                                     '${dController.myDoList[index].pod}',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                           ],
                    //                         ),
                    //                         Row(
                    //                           children: [
                    //                             const NormalText(
                    //                                 text:
                    //                                     'Port Of Destination:',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                             const SizedBox(
                    //                               width: 5,
                    //                             ),
                    //                             const Icon(Icons
                    //                                 .arrow_right_alt_outlined),
                    //                             NormalText(
                    //                                 text:
                    //                                     '${dController.myDoList[index].pol}',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                           ],
                    //                         ),
                    //                         Row(
                    //                           children: [
                    //                             NormalText(
                    //                                 text:
                    //                                     'Ref No: ${dController.myDoList[index].refno}',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                             const SizedBox(
                    //                               width: 5,
                    //                             ),
                    //                             const Icon(Icons
                    //                                 .arrow_right_alt_outlined),
                    //                             const SizedBox(
                    //                               width: 5,
                    //                             ),
                    //                             NormalText(
                    //                                 text:
                    //                                     'Do Validity : ${dValidity.substring(0, 10)}',
                    //                                 size: 15.0,
                    //                                 color: Colors.black),
                    //                           ],
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 );
                    //               })
                    //           : Center(
                    //               child: SemiWeighText(
                    //                   text: "No Data Found",
                    //                   size: 18.0,
                    //                   color: AppColor.textColor),
                    //             ),
                    //     ))
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
