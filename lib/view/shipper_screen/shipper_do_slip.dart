import 'package:flutter/material.dart';
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
        title:
            WeightText(color: AppColor.black, text: 'Delivery Order', size: 20),
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
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeightText(
                            text: "From Date",
                            size: 18,
                            color: AppColor.textColor),
                        SizeBox.customHeight(8),
                        TextField(
                          controller: dController.doSlipFromDate,
                          decoration: InputDecoration(
                              hintText: "Select the date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  dController.chooseFromDate();
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              )),
                        ),
                        SizeBox.customHeight(10),
                        WeightText(
                            text: "To Date",
                            size: 18,
                            color: AppColor.textColor),
                        SizeBox.customHeight(8),
                        TextField(
                          controller: dController.doSlipToDate,
                          decoration: InputDecoration(
                              hintText: "Select the date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  dController.chooseToDate();
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              )),
                        ),
                        SizeBox.customHeight(8),
                        WeightText(
                            text: "Reference No",
                            size: 18,
                            color: AppColor.textColor),
                        SizeBox.customHeight(8),
                        TextFormField(
                          controller: dController.doSlipReference,
                          cursorColor: AppColor.black,
                          decoration: InputDecoration(
                              hintText: "Enter the Detials",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                        SizeBox.customHeight(20),
                        Center(
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
                        SizeBox.customHeight(20),
                        SizedBox(
                            height: 500,
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12, left: 10, bottom: 5),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'DO No : ${dController.myDoList[index].doNo}',
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
                                                            'Bar Code : ${dController.myDoList[index].brcode}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Booking No : ${dController.myDoList[index].bookingno}',
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
                                                            'Booking Date : ${bDate.substring(0, 10)}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const NormalText(
                                                        text:
                                                            'Port Of Loading :',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            '${dController.myDoList[index].pod}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const NormalText(
                                                        text:
                                                            'Port Of Destination:',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            '${dController.myDoList[index].pol}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Ref No: ${dController.myDoList[index].refno}',
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
                                                            'Do Validity : ${dValidity.substring(0, 10)}',
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
