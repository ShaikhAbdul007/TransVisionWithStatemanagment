import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/loading_list_controller.dart';
import 'package:tranvision_customer_app/model/loading_list_model/refresh_on_load_model.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:tranvision_customer_app/view/shipper_screen/loading_list/update_scree.dart';

class LoadingListUpdateScreen extends StatefulWidget {
  const LoadingListUpdateScreen({Key? key}) : super(key: key);

  @override
  State<LoadingListUpdateScreen> createState() =>
      _LoadingListUpdateScreenState();
}

class _LoadingListUpdateScreenState extends State<LoadingListUpdateScreen> {
  late List<MyLoadingList> myList;
  @override
  Widget build(BuildContext context) {
    LoadingListController loadController = Get.put(LoadingListController());
    return Scaffold(
      appBar: AppBar(
        title: WeightText(color: AppColor.black, text: 'Review', size: 20.sp),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: FutureBuilder(
          future: loadController
              .getLoadingDataApi()
              .then((value) => myList = value),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: loadController.loadingDataList.length,
                  itemBuilder: (context, index) {
                    MyLoadingList loadingDataList =
                        loadController.loadingDataList[index];
                    return Card(
                      child: ExpansionTile(
                        title: SemiWeighText(
                          text: 'Container : ${snapshot.data[index].container}',
                          color: AppColor.black,
                          size: 14.sp,
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Get.to(() => const LoadingListEditScreen(),
                                      arguments: myList[index]);
                                  print("tap");
                                },
                                iconSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 8.w),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: SemiWeighText(
                                              text:
                                                  'Port : ${snapshot.data[index].port}',
                                              color: AppColor.black,
                                              size: 14.sp,
                                            ),
                                          ),
                                          SizeBox.customWidth(10.w),
                                          Expanded(
                                            child: SemiWeighText(
                                              text:
                                                  'FPOD : ${snapshot.data[index].fpod}',
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
                                              text:
                                                  'Size : ${snapshot.data[index].size}',
                                              color: AppColor.black,
                                              size: 14.sp,
                                            ),
                                          ),
                                          SizeBox.customWidth(10.w),
                                          Expanded(
                                            child: SemiWeighText(
                                              text:
                                                  'Type : ${snapshot.data[index].type}',
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
                                          TextField(
                                            readOnly: true,
                                            // onChanged: (value) => changedValue(
                                            //     index, 'weigth', value),
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].weight
                                                    .toString(),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.r))),
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
                                          TextField(
                                            readOnly: true,
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].imco,
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.r))),
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
                                          TextField(
                                            readOnly: true,
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].status,
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.r))),
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
                                          TextField(
                                            readOnly: true,
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].stow,
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.r))),
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
                                          TextField(
                                            readOnly: true,
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].remark,
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.r))),
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
                                          TextField(
                                            readOnly: true,
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].trans,
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.r))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SemiWeighText(
                text: "Waiting...",
                color: AppColor.textColor,
                size: 13.sp,
              ));
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                  child: SemiWeighText(
                text: "Can't Connect to Server...",
                color: AppColor.textColor,
                size: 13.sp,
              ));
            } else {
              return Center(
                  child: SemiWeighText(
                      text: "No Data Found",
                      size: 15.0,
                      color: AppColor.textColor));
            }
          }),
    );
  }

  changedValue(int index, String attibute, String value) {
    var temp = myList;

    temp[index].setWeight(value);

    setState(() {
      myList = temp;
    });
    print(myList);
  }
}
