import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/bill_summary_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class BillSummary extends StatelessWidget {
  const BillSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 13;
    final width = MediaQuery.of(context).size.width;
    BillSummaryController bController = Get.put(BillSummaryController());
    return Scaffold(
      appBar: AppBar(
        title:
            WeightText(color: AppColor.black, text: 'Bill Summary', size: 20),
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
                    "assets/images/bill.png",
                    fit: BoxFit.fill,
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Column(
                      children: [
                        Form(
                          key: bController.myOurKey,
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
                                    return "Please Select date";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: bController.billSumFormDate,
                                decoration: InputDecoration(
                                    hintText: "Select the date",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        bController.chooseFromDate();
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
                              TextField(
                                controller: bController.billSumToDate,
                                decoration: InputDecoration(
                                    hintText: "Select the date",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        bController.chooseToDate();
                                      },
                                      icon: const Icon(
                                          Icons.calendar_month_outlined),
                                    )),
                              ),
                              SizeBox.customHeight(8),
                              WeightText(
                                  text: "Reference No",
                                  size: 18,
                                  color: AppColor.textColor),
                              SizeBox.customHeight(8),
                              Container(
                                  padding: const EdgeInsets.all(2.0),
                                  margin: const EdgeInsets.all(2.0),
                                  height: height,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: AppColor.black,
                                          style: BorderStyle.solid,
                                          width: 1.0)),
                                  child: const TextField(
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Enter Quantity",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: InkWell(
                            onTap: () {},
                            child: Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                        ),
                        Container(
                            height: 500,
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
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
                                        padding: const EdgeInsets.all(5.0),
                                        child: Card(
                                          shadowColor: Colors.orange,
                                          elevation: 5,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0,
                                                left: 10,
                                                bottom: 5.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Invoice No : ${bController.myList[index].billno.toString()}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
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
                                                            'BL No : ${bController.myList[index].blno.toString()}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            'BL Date: ${billDate.substring(0, 10)}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const NormalText(
                                                        text: 'Vessel : ',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            '${bController.myList[index].vesselname}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const NormalText(
                                                        text: 'Voyage : ',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            '${bController.myList[index].voyage}',
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
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            '${bController.myList[index].billtotals}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const NormalText(
                                                        text:
                                                            'Payment Amount : ',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                            '${bController.myList[index].payamt}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const NormalText(
                                                        text:
                                                            'Balance Amount : ',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text: bController
                                                            .myList[index]
                                                            .balamt
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
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text: bController
                                                            .myList[index]
                                                            .tdsamt
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
                                    })
                                : Padding(
                                    padding: const EdgeInsets.only(top: 200.0),
                                    child: Column(
                                      children: [
                                        const CircularProgressIndicator(
                                          semanticsLabel: "No Data Found",
                                          semanticsValue: "5",
                                          color: Colors.amberAccent,
                                        ),
                                        SizeBox.customHeight(8),
                                        SemiWeighText(
                                            text:
                                                " Please wait while fetching the details",
                                            size: 15,
                                            color: AppColor.textColor)
                                      ],
                                    ),
                                  )))
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
