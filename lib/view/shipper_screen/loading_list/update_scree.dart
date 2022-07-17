import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/loading_list_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/vessel_lis_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/voyage_lis_controller.dart';
import 'package:tranvision_customer_app/model/loading_list_model/refresh_on_load_model.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tranvision_customer_app/view/shipper_screen/loading_list/loading_list_review_screen.dart';

class LoadingListEditScreen extends StatefulWidget {
  const LoadingListEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingListEditScreen> createState() => _LoadingListEditScreenState();
}

class _LoadingListEditScreenState extends State<LoadingListEditScreen> {
  MyLoadingList myList = Get.arguments;
  UserLoginDetails user = UserLoginDetails();
  VesselController vesselController = Get.find();
  VoyageController voyageController = Get.find();
  LoadingListController loadController = Get.find();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            WeightText(color: AppColor.black, text: 'Update List', size: 20.sp),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          FormBuilder(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          children: [
                            Text('${myList.container}'),
                            Row(
                              children: [
                                Expanded(
                                  child: SemiWeighText(
                                    text: 'Port : ${myList.port}',
                                    color: AppColor.black,
                                    size: 14.sp,
                                  ),
                                ),
                                SizeBox.customWidth(10.w),
                                Expanded(
                                  child: SemiWeighText(
                                    text: 'FPOD : ${myList.fpod}',
                                    color: AppColor.black,
                                    size: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizeBox.customHeight(5.h),
                            Row(
                              children: [
                                Expanded(
                                  child: SemiWeighText(
                                    text: 'Size : ${myList.size}',
                                    color: AppColor.black,
                                    size: 14.sp,
                                  ),
                                ),
                                SizeBox.customWidth(10.w),
                                Expanded(
                                  child: SemiWeighText(
                                    text: 'Type : ${myList.type}',
                                    color: AppColor.black,
                                    size: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizeBox.customHeight(5.h),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SemiWeighText(
                                  text: "Weight",
                                  size: 14.sp,
                                  color: Colors.black,
                                ),
                                FormBuilderTextField(
                                  name: "weight",
                                  expands: false,
                                  decoration: InputDecoration(
                                      hintText: "Weight",
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2.0,
                                              style: BorderStyle.solid,
                                              color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(9.r))),
                                ),
                              ],
                            ),
                          ),
                          SizeBox.customWidth(5.w),
                          Expanded(
                            child: Column(
                              children: [
                                SemiWeighText(
                                  text: "IMCO",
                                  size: 14.sp,
                                  color: Colors.black,
                                ),
                                FormBuilderTextField(
                                  name: "imco",
                                  // controller: loadController.imcoController,
                                  expands: false,
                                  decoration: InputDecoration(
                                      hintText: "IMco",
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2.0,
                                              style: BorderStyle.solid,
                                              color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(9.r))),
                                ),
                              ],
                            ),
                          ),
                          SizeBox.customWidth(5.w),
                          Expanded(
                            child: Column(
                              children: [
                                SemiWeighText(
                                  text: "Status",
                                  size: 14.sp,
                                  color: Colors.black,
                                ),
                                FormBuilderTextField(
                                  name: "status",
                                  // controller: loadController.statusController,
                                  expands: false,
                                  decoration: InputDecoration(
                                      hintText: "Status",
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2.0,
                                              style: BorderStyle.solid,
                                              color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(9.r))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizeBox.customWidth(5.w),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SemiWeighText(
                                  text: "STOW",
                                  size: 14.sp,
                                  color: Colors.black,
                                ),
                                FormBuilderTextField(
                                  name: "stow",
                                  // controller: loadController.stowController,
                                  expands: false,
                                  decoration: InputDecoration(
                                      hintText: "STOW",
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2.0,
                                              style: BorderStyle.solid,
                                              color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(9.r))),
                                ),
                              ],
                            ),
                          ),
                          SizeBox.customWidth(5.w),
                          Expanded(
                            child: Column(
                              children: [
                                SemiWeighText(
                                  text: "Remark",
                                  size: 14.sp,
                                  color: Colors.black,
                                ),
                                FormBuilderTextField(
                                  name: "remark",
                                  // controller: loadController.remarkController,
                                  expands: false,
                                  decoration: InputDecoration(
                                      hintText: "Remark",
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2.0,
                                              style: BorderStyle.solid,
                                              color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(9.r))),
                                ),
                              ],
                            ),
                          ),
                          SizeBox.customWidth(5.w),
                          Expanded(
                            child: Column(
                              children: [
                                SemiWeighText(
                                  text: "Transportation",
                                  size: 14.sp,
                                  color: Colors.black,
                                ),
                                FormBuilderTextField(
                                  name: "transportation",
                                  expands: false,
                                  decoration: InputDecoration(
                                      hintText: "Transportation",
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2.0,
                                              style: BorderStyle.solid,
                                              color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(9.r))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizeBox.customHeight(10.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
              onTap: () async {
                final partycode = user.retriveUserNameFromGetStrogare();
                formKey.currentState!.save();
                var fromdata = formKey.currentState?.value;
                // await loadController.addListItem({
                //   "weight": loadController.weightController.text.toString(),
                //   "imco": loadController.imcoController.text.toString(),
                //   "status": loadController.statusController.text.toString(),
                //   "stow": loadController.stowController.text.toString(),
                //   "remark": loadController.remarkController.text.toString(),
                //   "transportation":
                //       loadController.transpotationController.text.toString(),
                //   "partycode": partycode,
                //   "vesselname": vesselController.vesselNewValue,
                //   "voyage": voyageController.selectedvalue,
                //   "container": myList.container,
                //   "size": myList.size,
                //   "type": myList.type
                // });
                await loadController.updatePostData({
                  "Weight": fromdata!["weight"].toString(),
                  "IMCO": fromdata["imco"].toString(),
                  "Status": fromdata["status"].toString(),
                  "Stow": fromdata["stow"].toString(),
                  "Remark": fromdata["remark"].toString(),
                  "Transportation": fromdata["transportation"].toString(),
                  "partycode": partycode,
                  "vesselname": vesselController.vesselNewValue,
                  "voyage": voyageController.selectedvalue,
                  "Container": myList.container,
                  "Size": myList.size,
                  "Type": myList.type
                });
                Get.off(() => const LoadingListUpdateScreen());
                print("tapped");
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
                      text: 'Update',
                      size: 18.sp,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
