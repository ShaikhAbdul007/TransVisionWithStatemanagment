import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/bill_of_lading_controller/bill_of_lading.dart';
import 'package:tranvision_customer_app/controller/shipperController/lading_home_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:tranvision_customer_app/utils/dropDown/bill_of_lading.dart';

class BlHome extends StatefulWidget {
  const BlHome({Key? key}) : super(key: key);

  @override
  State<BlHome> createState() => _BlHomeState();
}

class _BlHomeState extends State<BlHome> {
  @override
  Widget build(BuildContext context) {
    BillOfLadding billOfLadding = Get.put(BillOfLadding());
    BillOfLaddingHome billOfLaddingHome = Get.put(BillOfLaddingHome());

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            "assets/images/loading.png",
            fit: BoxFit.cover,
            height: 250.h,
          ),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 5.h),
                    child: WeightText(
                        text: "Search", size: 20.sp, color: AppColor.textColor),
                  ),
                  SizeBox.customHeight(5.h),
                  BillLading(
                    listItems: billOfLadding.item,
                    selectedValue: billOfLadding.selectedValue,
                    notifyParent: (value) {
                      setState(() {
                        billOfLadding.selectedValue = value;
                      });
                    },
                  ),
                ],
              ),
              SizeBox.customHeight(15.h),
              Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: TextFormField(
                    controller: billOfLadding.billController,
                    cursorColor: AppColor.black,
                    decoration: InputDecoration(
                        hintText: "Enter the Detials",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        )),
                  )),
            ],
          ),
          SizeBox.customHeight(15.h),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: Get.context!,
                  builder: (context) => buildSheet());
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
            padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
            child: SizedBox(
                height: 500.h,
                child: Obx(() => billOfLaddingHome.billOfLadingOnLoad.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: billOfLaddingHome.billOfLadingOnLoad.length,
                        itemBuilder: (context, index) {
                          String issuedate = billOfLaddingHome
                              .billOfLadingOnLoad[index].issuedate
                              .toString();
                          String etddate = billOfLaddingHome
                              .billOfLadingOnLoad[index].etd
                              .toString();
                          return Card(
                            shadowColor: Colors.orange,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, left: 10.w, bottom: 5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      NormalText(
                                          text:
                                              'BL No : ${billOfLaddingHome.billOfLadingOnLoad[index].blno.toString()}',
                                          size: 13.sp,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text:
                                              'Booking No : ${billOfLaddingHome.billOfLadingOnLoad[index].bookingno.toString()}',
                                          size: 13.sp,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      NormalText(
                                          text:
                                              'Issue Date: ${issuedate.substring(0, 10)}',
                                          size: 13.sp,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text:
                                              'ETD: ${etddate.substring(0, 10)}',
                                          size: 13.sp,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      NormalText(
                                          text: 'Act-BL-No:',
                                          size: 13.sp,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text: billOfLaddingHome
                                              .billOfLadingOnLoad[index].blact
                                              .toString(),
                                          size: 13.sp,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      NormalText(
                                          text: 'Vessel/Voyage:',
                                          size: 13.sp,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text: billOfLaddingHome
                                              .billOfLadingOnLoad[index].vessel
                                              .toString(),
                                          size: 13.sp,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      NormalText(
                                          text: 'Place :',
                                          size: 13.sp,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text: billOfLaddingHome
                                              .billOfLadingOnLoad[index].place
                                              .toString(),
                                          size: 13.sp,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      NormalText(
                                          text: 'Place Of Loading:',
                                          size: 13.sp,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text:
                                              '${billOfLaddingHome.billOfLadingOnLoad[index].pol}',
                                          size: 13.sp,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      NormalText(
                                          text: 'Place Of Discharge:',
                                          size: 13.sp,
                                          color: Colors.black),
                                      NormalText(
                                          text:
                                              '${billOfLaddingHome.billOfLadingOnLoad[index].podis}',
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
                                        title: "Bill of Lading PDF",
                                        content: Column(
                                          children: const [
                                            Text("You want To Share ?")
                                          ],
                                        ),
                                        barrierDismissible: false,
                                        actions: [
                                          ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.thumb_up_sharp),
                                              label: const Text("Confirm")),
                                          ElevatedButton.icon(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: const Icon(
                                                  Icons.thumb_down_sharp),
                                              label: const Text("Cancel"))
                                        ],
                                      ),
                                      child: Container(
                                          width: 100.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(10.r),
                                                      bottom: Radius.circular(
                                                          10.r)),
                                              color: AppColor.primary),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.share),
                                              SizeBox.customWidth(3.w),
                                              SemiWeighText(
                                                  text: "Share",
                                                  size: 15.sp,
                                                  color: AppColor.black),
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
          )
        ],
      ),
    );
  }
}

buildSheet() {
  BillOfLaddingHome billOfLaddingHome = Get.find();
  return SizedBox(
      height: 500.h,
      child: FutureBuilder(
          future: billOfLaddingHome.getBillOfLandingRefresh(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: billOfLaddingHome.billOfLadingOnRefresh.length,
                  itemBuilder: (context, index) {
                    String issueDate = snapshot.data[index].issuedate;
                    String etdDate = snapshot.data[index].etd;
                    return Card(
                      shadowColor: Colors.orange,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, bottom: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                NormalText(
                                    text:
                                        'BL No :  ${snapshot.data[index].blno.toString()}',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text:
                                        'Booking No :  ${snapshot.data[index].bookingno.toString()}',
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                NormalText(
                                    text:
                                        'Issue Date:  ${issueDate.substring(0, 10)}',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: 'ETD:  ${etdDate.substring(0, 10)}',
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const NormalText(
                                    text: 'Act-BL-No',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: snapshot.data[index].blact.toString(),
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const NormalText(
                                    text: 'Vessel/Voyage:',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: snapshot.data[index].vessel,
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const NormalText(
                                    text: 'Place : ',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: snapshot.data[index].place,
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const NormalText(
                                    text: 'Place Of Loading',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: '${snapshot.data[index].pol}',
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const NormalText(
                                    text: 'Place Of Discharge :-',
                                    size: 15.0,
                                    color: Colors.black),
                                NormalText(
                                    text: '${snapshot.data[index].podis}',
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
              return Center(
                child: Column(
                  children: [
                    const CircularProgressIndicator(),
                    SemiWeighText(
                        text: "Please Wait",
                        size: 13.sp,
                        color: AppColor.hintTextColor)
                  ],
                ),
              );
            }
          }));
}
