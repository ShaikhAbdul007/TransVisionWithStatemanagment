import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/commodity_controller/commodity_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/icd_controller/newicdfrom_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/icd_controller/newicdto_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_controller/destination_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_controller/loading_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/size/size_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/type/type_controller.dart';
import 'package:tranvision_customer_app/controller/shipperController/booking_controller/booking_page_controller.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';
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

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  SizeController sController = Get.put(SizeController());
  CommodityController commodity = Get.put(CommodityController());
  IcdNewFromController icdController = Get.put(IcdNewFromController());
  IcdNewToController icdToController = Get.put(IcdNewToController());
  LoadingController loadingController = Get.put(LoadingController());
  DestinationController destinationController =
      Get.put(DestinationController());
  TypeController typeController = Get.put(TypeController());
  Controller c = Get.put(Controller());

  @override
  void dispose() {
    Get.delete<Controller>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WeightText(
            color: AppColor.black, text: 'Booking Page', size: 20.sp),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h, left: 5.w, right: 5.w),
          child: Form(
            key: c.bookingFromKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: BoldText(
                          text: "ICD From",
                          size: 15.sp,
                          color: AppColor.textColor),
                    ),
                    Obx(() => icdController.icdList.isNotEmpty
                        ? IcdFrom(
                            listItems: icdController.icdList,
                            notifyParent: (value) {
                              setState(() {
                                icdController.icdFromValue = value;
                              });
                              icdToController.icdToValue = null;
                              icdToController.fetchIcdToPort(value);
                            },
                            selectedIcdFromValue: icdController.icdFromValue,
                          )
                        : IcdFrom(
                            listItems: icdController.icdList,
                            notifyParent: (value) {
                              setState(() {
                                icdController.icdFromValue = value;
                              });
                            },
                            selectedIcdFromValue: icdController.icdFromValue,
                          )),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, top: 5.h),
                      child: BoldText(
                          text: "Port Of Loading",
                          size: 15.sp,
                          color: AppColor.textColor),
                    ),
                    Obx(() => loadingController.loadingList.isNotEmpty
                        ? LoadingPort(
                            listItems: loadingController.loadingList,
                            loadingPortValue:
                                loadingController.loadingPortValue,
                            notifyParent: (value) {
                              setState(() {
                                loadingController.loadingPortValue = value;
                              });
                              destinationController.destinationValue = null;
                              destinationController.getDestinationApi(value);
                            },
                          )
                        : LoadingPort(
                            listItems: loadingController.loadingList,
                            loadingPortValue:
                                loadingController.loadingPortValue,
                            notifyParent: (value) {
                              setState(() {
                                loadingController.loadingPortValue = value;
                              });
                            },
                          )),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, top: 5.h),
                      child: BoldText(
                          text: "Port Of Destination ",
                          size: 15.sp,
                          color: AppColor.textColor),
                    ),
                    Obx(
                      () => destinationController.destinationList.isEmpty
                          ? DestinationPort(
                              notifyParent: (value) {
                                destinationController.destinationValue = value;
                              },
                              listItems: destinationController.destinationList,
                            )
                          : DestinationPort(
                              notifyParent: (value) {
                                setState(() {
                                  destinationController.destinationValue =
                                      value;
                                });
                              },
                              listItems: destinationController.destinationList,
                              destinationValue:
                                  destinationController.destinationValue),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: BoldText(
                          text: "ICD To ",
                          size: 15.sp,
                          color: AppColor.textColor),
                    ),
                    Obx(() => icdToController.icdToList.isEmpty
                        ? IcdTo(
                            listItems: icdToController.icdToList,
                            notifyParent: ((value) {
                              // setState(() {
                              //   icdToController.icdToValue = value;
                              // });
                            }))
                        : IcdTo(
                            listItems: icdToController.icdToList,
                            icdToValue: icdToController.icdToValue,
                            notifyParent: ((value) {
                              setState(() {
                                icdToController.icdToValue = value;
                              });
                            }),
                          ))
                  ],
                ),
                SizeBox.customHeight(5.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: BoldText(
                                text: "Size",
                                size: 15.sp,
                                color: AppColor.textColor),
                          ),
                          SizeDropDown(
                            selectedOption: sController.selectedOption,
                            listItems: sController.ourContainerSize,
                            notifyParent: (value) {
                              setState(() {
                                sController.selectedOption = value;
                              });
                              typeController.selectedtype = null;
                              typeController.getTypeApi(value);
                            },
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
                            padding: EdgeInsets.only(left: 8.w),
                            child: BoldText(
                                text: "Type ",
                                size: 15.sp,
                                color: AppColor.textColor),
                          ),
                          Obx(
                            () => typeController.typeList.isNotEmpty
                                ? Type(
                                    notifyparent: (value) {
                                      setState(() {
                                        typeController.selectedtype = value;
                                      });
                                    },
                                    listItems: typeController.typeList,
                                    selectedType: typeController.selectedtype)
                                : Type(
                                    notifyparent: (value) {
                                      setState(() {
                                        typeController.selectedtype = value;
                                      });
                                    },
                                    listItems: typeController.typeList,
                                  ),
                          )
                        ],
                      ),
                    ),
                    SizeBox.customWidth(5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: BoldText(
                                text: "Commodity",
                                size: 15.sp,
                                color: AppColor.textColor),
                          ),
                          Obx(
                            () => Commodity(
                              listItems: commodity.commodity.value,
                              commodityValue: commodity.commodityValue,
                              notifyParent: (value) {
                                setState(() {
                                  commodity.commodityValue = value;
                                });
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
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: BoldText(
                                      text: "Class",
                                      size: 15.sp,
                                      color: AppColor.textColor),
                                ),
                                Container(
                                    height: 50.h,
                                    width: 500.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        border: Border.all(
                                            color: AppColor.black,
                                            style: BorderStyle.solid,
                                            width: 0.5.w)),
                                    child: TextFormField(
                                        validator: (value) => value!.isEmpty
                                            ? "Enter class"
                                            : null,
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
                                padding: EdgeInsets.only(left: 8.w),
                                child: BoldText(
                                    text: "UN No",
                                    size: 15.sp,
                                    color: AppColor.textColor),
                              ),
                              Container(
                                  padding: EdgeInsets.all(1.r),
                                  margin: EdgeInsets.all(5.r),
                                  height: 50.h,
                                  width: 500.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      border: Border.all(
                                          color: AppColor.black,
                                          style: BorderStyle.solid,
                                          width: 0.5.w)),
                                  child: TextFormField(
                                      validator: (value) =>
                                          value!.isEmpty ? "Enter UnNo" : null,
                                      controller: commodity.unController,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        hintText: "Enter UN.NO",
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: BoldText(
                                text: "Quantity ",
                                size: 15.sp,
                                color: AppColor.textColor),
                          ),
                          Container(
                              height: 50.h,
                              // width: 500.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      color: AppColor.black,
                                      style: BorderStyle.solid,
                                      width: 0.5.w)),
                              child: TextFormField(
                                  validator: (value) =>
                                      value!.isEmpty ? "Enter Quantity" : null,
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
                    SizeBox.customWidth(5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: BoldText(
                                text: "Freight",
                                size: 15.sp,
                                color: AppColor.textColor),
                          ),
                          Container(
                              height: 50.h,
                              // width: 500.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      color: AppColor.black,
                                      style: BorderStyle.solid,
                                      width: 0.5.w)),
                              child: TextFormField(
                                  validator: (value) =>
                                      value!.isEmpty ? "Enter Freight" : null,
                                  controller: c.freightcon,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    hintText: "freight",
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: BoldText(
                                text: "Weight",
                                size: 15.sp,
                                color: AppColor.textColor),
                          ),
                          Container(
                              height: 50.h,
                              // width: 500.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      color: AppColor.black,
                                      style: BorderStyle.solid,
                                      width: 0.5.w)),
                              child: TextFormField(
                                  validator: (value) =>
                                      value!.isEmpty ? "Enter Weight" : null,
                                  controller: c.weightcon,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    hintText: "Weight",
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ))),
                        ],
                      ),
                    ),
                    SizeBox.customWidth(5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: BoldText(
                                text: "Rate Agree",
                                size: 15.sp,
                                color: AppColor.textColor),
                          ),
                          Container(
                              height: 50.h,
                              // width: 500.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      color: AppColor.black,
                                      style: BorderStyle.solid,
                                      width: 0.5.w)),
                              child: TextFormField(
                                  validator: (value) =>
                                      value!.isEmpty ? "Enter Rateagree" : null,
                                  controller: c.rtag,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    hintText: "Rateagree",
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizeBox.customHeight(12.h),
                Padding(
                  padding:
                      EdgeInsets.only(right: 20.w, left: 20.w, bottom: 10.h),
                  child: Center(
                    child: Container(
                        padding: EdgeInsets.all(1.r),
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.orange[400])),
                          onPressed: () {
                            final isValid = c.bookingFromKey.currentState;
                            if (isValid!.validate()) {
                              UserLoginDetails user = UserLoginDetails();
                              var partycode =
                                  user.retriveUserNameFromGetStrogare();
                              c.addListItem({
                                "icdfrom": icdController.icdFromValue,
                                "icdto": icdToController.icdToValue,
                                "pol": loadingController.loadingPortValue,
                                "pod": destinationController.destinationValue,
                                "qty": c.ourCount.text.toString(),
                                "size": sController.selectedOption.toString(),
                                "type": typeController.selectedtype,
                                "commodity": commodity.commodityValue,
                                "classs":
                                    commodity.ourCassController.text.toString(),
                                "unno": commodity.unController.text.toString(),
                                "weight": c.weightcon.text,
                                "freight": c.freightcon.text,
                                "rateagreedby": c.rtag.text,
                                "partycode": partycode,
                              });
                              Get.to(
                                () => const BookingSecondPage(),
                                transition: Transition.leftToRightWithFade,
                              );
                            }
                          },
                          child: BoldText(
                              text: "Next",
                              size: 15.sp,
                              color: AppColor.textColor),
                        )),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
