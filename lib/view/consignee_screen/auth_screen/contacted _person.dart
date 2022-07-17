import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/myProfileController/consignee_profile_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class ConsigneeContactedPerson extends StatelessWidget {
  const ConsigneeContactedPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConsigneeController consigneeContantedPerson =
        Get.put(ConsigneeController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Column(children: [
                Image.asset(
                  "assets/images/contact.png",
                  fit: BoxFit.cover,
                  height: 250.h,
                ),
                WeightText(
                    text: "Contact Person",
                    size: 25.sp,
                    color: AppColor.textColor),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h),
                  child: Column(
                    children: [
                      FutureBuilder(
                          future: consigneeContantedPerson.getuserDetailsApi(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return TextField(
                                readOnly: true,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    // labelText: "Contacted person",
                                    hintText: snapshot.data.contactperson,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                    )),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }),
                      SizeBox.customHeight(20),
                      FutureBuilder(
                          future: consigneeContantedPerson.getuserDetailsApi(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return TextField(
                                readOnly: true,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    // labelText: "Contacted person",
                                    hintText: snapshot.data.contno,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                    )),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.w, right: 15.w, bottom: 10.h, top: 50.h),
                        child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: (() {}),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9.r),
                                    color: AppColor.primary),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.system_update_alt,
                                        color: Colors.black),
                                    WeightText(
                                        text: "Update",
                                        size: 18.sp,
                                        color: Colors.black),
                                  ],
                                ),
                              ),
                            )),
                            SizeBox.customWidth(20.w),
                            Expanded(
                                child: InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: 50.h,
                                padding: EdgeInsets.only(left: 20.w),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9.r),
                                    color: AppColor.editColor),
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit, color: Colors.black),
                                    WeightText(
                                        text: "Edit",
                                        size: 18.sp,
                                        color: Colors.black),
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ])
            ],
          ),
        ));
  }
}
