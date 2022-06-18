import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/commodity_controller/commodity_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/icd_controller/newicdfrom_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/icd_controller/newicdto_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_controller/destination_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_controller/loading_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/size/size_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/type/type_controller.dart';
import 'package:tranvision_customer_app/controller/shipperController/booking_controller/booking_page_controller.dart';
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

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeController sController = Get.put(SizeController());
    CommodityController commodity = Get.put(CommodityController());
    IcdNewFromController icdController = Get.put(IcdNewFromController());
    IcdNewToController icdToController = Get.put(IcdNewToController());
    LoadingController loadingController = Get.put(LoadingController());
    DestinationController destinationController =
        Get.put(DestinationController());
    final height = MediaQuery.of(context).size.height / 9.5;
    final width = MediaQuery.of(context).size.width;
    TypeController typeController = Get.put(TypeController());
    Controller c = Get.put(Controller());

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
                    Obx(() => icdController.icdList.isNotEmpty
                        ? IcdFrom(
                            listItems: icdController.icdList,
                            notifyParent: icdController.updatedIcdFromValue,
                            selectedIcdFromValue: icdController.icdFromValue,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: BoldText(
                          text: "Port Of Loading",
                          size: 18,
                          color: AppColor.textColor),
                    ),
                    Obx(() => loadingController.loadingList.isNotEmpty
                        ? LoadingPort(
                            listItems: loadingController.loadingList,
                            notifyParent: loadingController.updatedLoadingPort,
                            loadingPortValue:
                                loadingController.loadingPortValue,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: BoldText(
                          text: "Port Of Destination ",
                          size: 18,
                          color: AppColor.textColor),
                    ),
                    Obx(
                      () => destinationController.destinationList.isEmpty
                          ? DestinationPort(
                              listItems: destinationController.destinationList,
                            )
                          : DestinationPort(
                              listItems: destinationController.destinationList,
                              destinationValue:
                                  destinationController.destinationValue),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: BoldText(
                          text: "ICD To ", size: 18, color: AppColor.textColor),
                    ),
                    Obx(() => icdToController.icdToList.isNotEmpty
                        ? IcdTo(
                            listItems: icdToController.icdToList,
                          )
                        : IcdTo(
                            listItems: icdToController.icdToList,
                            icdToValue: icdToController.icdToValue,
                          ))
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
                              child: TextField(
                                  controller: c.ourCount,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
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
                          SizeDropDown(
                            selectedOption: sController.selectedOption,
                            listItems: sController.ourContainerSize,
                            notifyParent: sController.sizeUpdated,
                          ),
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
                          Obx(
                            () => typeController.typeList.isNotEmpty
                                ? Type(
                                    listItems: typeController.typeList,
                                    selectedType: typeController.selectedtype)
                                : Type(
                                    listItems: typeController.typeList,
                                  ),
                          )
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
                          Obx(
                            () => Commodity(
                              listItems: commodity.commodity.value,
                              commodityValue: commodity.commodityValue,
                              notifyParent: (value) {
                                commodity.toggle(value);
                              },
                            ),
                          )
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
                                    child: TextField(
                                        controller: commodity.ourCassController,
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
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
                                  child: TextField(
                                      controller: commodity.unController,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
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
                      Get.to(() => const BookingSecondPage(), arguments: [
                        icdController.icdFromValue,
                        icdToController.icdToValue,
                        loadingController.loadingPortValue,
                        destinationController.destinationValue,
                        c.ourCount.text,
                        sController.selectedOption,
                        typeController.selectedtype,
                        commodity.commodityValue,
                        commodity.ourCassController.text,
                        commodity.unController.text,
                      ]);
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
