import 'package:flutter/material.dart';
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
    return ListView(
      children: [
        Image.asset(
          "assets/images/loading.png",
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: WeightText(
                      text: "Search", size: 20.0, color: AppColor.textColor),
                ),
                const SizedBox(height: 5.0),
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
            SizeBox.customHeight(15.0),
            Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: TextFormField(
                  controller: billOfLadding.billController,
                  cursorColor: AppColor.black,
                  decoration: InputDecoration(
                      hintText: "Enter the Detials",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                )),
          ],
        ),
        SizeBox.customHeight(15.0),
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: Get.context!, builder: (context) => buildSheet());
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
          padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: SizedBox(
              height: 500,
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
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
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
                                            'BL No :  ${billOfLaddingHome.billOfLadingOnLoad[index].blno.toString()}',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            'Booking No :  ${billOfLaddingHome.billOfLadingOnLoad[index].bookingno.toString()}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    NormalText(
                                        text:
                                            'Issue Date:  ${issuedate.substring(0, 10)}',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            'ETD:  ${etddate.substring(0, 10)}',
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
                                        text: billOfLaddingHome
                                            .billOfLadingOnLoad[index].blact
                                            .toString(),
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
                                        text: billOfLaddingHome
                                            .billOfLadingOnLoad[index].vessel
                                            .toString(),
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
                                        text: billOfLaddingHome
                                            .billOfLadingOnLoad[index].place
                                            .toString(),
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
                                        text:
                                            '${billOfLaddingHome.billOfLadingOnLoad[index].pol}',
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
                                        text:
                                            '${billOfLaddingHome.billOfLadingOnLoad[index].podis}',
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
        )
      ],
    );
  }
}

buildSheet() {
  BillOfLaddingHome billOfLaddingHome = Get.find();
  return SizedBox(
      height: 500,
      child: Obx(() => billOfLaddingHome.billOfLadingOnRefresh.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: billOfLaddingHome.billOfLadingOnRefresh.length,
              itemBuilder: (context, index) {
                String? date =
                    billOfLaddingHome.billOfLadingOnRefresh[index].issueDate;
                String etdDate = billOfLaddingHome
                    .billOfLadingOnRefresh[index].etd
                    .toString();
                return Card(
                  shadowColor: Colors.orange,
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 10, bottom: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            NormalText(
                                text:
                                    'BL No :  ${billOfLaddingHome.billOfLadingOnRefresh[index].blNo.toString()}',
                                size: 15.0,
                                color: Colors.black),
                            const Icon(Icons.arrow_right_alt_outlined),
                            NormalText(
                                text:
                                    'Booking No :  ${billOfLaddingHome.billOfLadingOnRefresh[index].bookingNo}',
                                size: 15.0,
                                color: Colors.black),
                          ],
                        ),
                        Row(
                          children: [
                            NormalText(
                                text:
                                    'Issue Date:  ${date?.substring(0, 10).toString()}',
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
                                text:
                                    '${billOfLaddingHome.billOfLadingOnRefresh[index].blAct}',

                                //  billOfLaddingHome
                                //     .billOfLadingOnRefresh[index].blAct
                                //     .toString(),
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
                                text:
                                    '${billOfLaddingHome.billOfLadingOnRefresh[index].vessel}',
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
                                text:
                                    '${billOfLaddingHome.billOfLadingOnRefresh[index].place}',
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
                                text:
                                    '${billOfLaddingHome.billOfLadingOnRefresh[index].pol}',
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
                                text:
                                    '${billOfLaddingHome.billOfLadingOnRefresh[index].podIs}',
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
              child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SemiWeighText(
                  text: "No Data Found please check the date range",
                  size: 18.0,
                  color: AppColor.textColor),
            ))));
}
