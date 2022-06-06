import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/commodity_controller/commodity_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/size/size_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:tranvision_customer_app/utils/dropDown/commodity.dart';
import 'package:tranvision_customer_app/utils/dropDown/destination_port.dart';
import 'package:tranvision_customer_app/utils/dropDown/icd_from.dart';
import 'package:tranvision_customer_app/utils/dropDown/icd_to.dart';
import 'package:tranvision_customer_app/utils/dropDown/loading_port.dart';
import 'package:tranvision_customer_app/utils/dropDown/size.dart';
import 'package:tranvision_customer_app/utils/dropDown/type.dart';
import 'package:tranvision_customer_app/view/shipper_screen/booking_screen/booking_second_page.dart';
import '../../../controller/other_utils_Controller/dropdown_Controller/icdController/icdFromController.dart';
import '../../../controller/other_utils_Controller/dropdown_Controller/icdController/icdToController.dart';
import '../../../controller/shipperController/booking_controller/booking_page_controller.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeController size = Get.put(SizeController());
    CommodityController commodity = Get.put(CommodityController());
    BookingPageController bookController = Get.put(BookingPageController());
    IcdFromController icdFromController = Get.put(IcdFromController());
    IcdToController icdToController = Get.put(IcdToController());
    final height = MediaQuery.of(context).size.height / 13;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:
            WeightText(color: AppColor.black, text: 'Booking Page', size: 20),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: BoldText(
                          text: "ICD From",
                          size: 18,
                          color: AppColor.textColor),
                    ),
                    FutureBuilder(
                        future: icdFromController.fetchIcdFromPort(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Obx(() => IcdFrom(
                                  listItems:
                                      icdFromController.icdFromList.value,
                                  // icdFromValue: icdFromController.icdFromValue,
                                  notifyParent: (value) {
                                    icdFromController
                                        .updatedIcdFromValue(value);
                                  },
                                ));
                          } else if (snapshot.hasError) {
                            return const Icon(Icons.error_outline);
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: BoldText(
                          text: "Port Of Loading",
                          size: 18,
                          color: AppColor.textColor),
                    ),
                    LoadingPort(listItems: bookController.option),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: BoldText(
                          text: "Port Of Destination ",
                          size: 18,
                          color: AppColor.textColor),
                    ),
                    DestinationPort(listItems: bookController.option),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: BoldText(
                          text: "ICD To ", size: 18, color: AppColor.textColor),
                    ),
                    FutureBuilder(
                        future: icdFromController.fetchIcdFromPort(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Obx(() => IcdTo(
                                  listItems: icdToController.icdToList.value,
                                ));
                          } else if (snapshot.hasError) {
                            return const Icon(Icons.error_outline);
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: BoldText(
                                text: "Quantity ",
                                size: 18,
                                color: AppColor.textColor),
                          ),
                          Container(
                              padding: const EdgeInsets.all(5.0),
                              margin: const EdgeInsets.all(5.0),
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: AppColor.black,
                                      style: BorderStyle.solid,
                                      width: 2.0)),
                              child: const TextField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Enter Quantity",
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  )))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: BoldText(
                                text: "Size",
                                size: 18,
                                color: AppColor.textColor),
                          ),
                          Size(listItems: bookController.option),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: BoldText(
                                text: "Type ",
                                size: 18,
                                color: AppColor.textColor),
                          ),
                          Type(listItems: bookController.option),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: BoldText(
                                text: "Commodity",
                                size: 18,
                                color: AppColor.textColor),
                          ),
                          Commodity(
                            listItems: commodity.commodity,
                            notifyParent: (value) {
                              commodity.insertRow(value);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Obx(
                  () => Visibility(
                    visible: commodity.isVisible.value,
                    child: Row(
                      children: [
                        if (commodity.isVisible.value)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: BoldText(
                                      text: "Class",
                                      size: 18,
                                      color: AppColor.textColor),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(5.0),
                                    margin: const EdgeInsets.all(5.0),
                                    height: height,
                                    width: width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: AppColor.black,
                                            style: BorderStyle.solid,
                                            width: 2.0)),
                                    child: const TextField(
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          hintText: "Enter Class",
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                        ))),
                              ],
                            ),
                          ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: BoldText(
                                    text: "UN No",
                                    size: 18,
                                    color: AppColor.textColor),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(5.0),
                                  margin: const EdgeInsets.all(5.0),
                                  height: height,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: AppColor.black,
                                          style: BorderStyle.solid,
                                          width: 2.0)),
                                  child: const TextField(
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Enter UN.NO",
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      )))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizeBox.customHeight(12),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10.0),
            child: Center(
              child: Container(
                  padding: const EdgeInsets.all(1),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange[400])),
                    onPressed: () {
                      Get.to(() => const BookingSecondPage());
                    },
                    child: BoldText(
                        text: "Next", size: 18, color: AppColor.textColor),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
