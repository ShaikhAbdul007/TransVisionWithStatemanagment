import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/loading_list_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/vessel_lis_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/voyage_lis_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:tranvision_customer_app/utils/dropDown/vaseel.dart';
import 'package:tranvision_customer_app/utils/dropDown/voyage.dart';

import 'loading_list_review_screen.dart';

class LoadingList extends StatefulWidget {
  const LoadingList({Key? key}) : super(key: key);

  @override
  State<LoadingList> createState() => _LoadingListState();
}

class _LoadingListState extends State<LoadingList> {
  @override
  Widget build(BuildContext context) {
    VoyageController contVoyage = Get.put(VoyageController());
    VesselController contVess = Get.put(VesselController());
    LoadingListController loadController = Get.put(LoadingListController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: WeightText(
            color: AppColor.black, text: 'Loading List', size: 20.sp),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/vassel.png",
                fit: BoxFit.cover,
                height: 250.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeightText(
                        text: "Vessel", size: 18.sp, color: AppColor.textColor),
                    Obx(() => contVess.vesselList.isNotEmpty
                        ? VesselDrop(
                            listItems: contVess.vesselList,
                            notifyParent: (value) {
                              setState(() {
                                contVess.vesselNewValue = value;
                              });
                              contVoyage.selectedvalue = null;
                              contVoyage.getVoyageApi(value);
                            },
                            vesselNewValue: contVess.vesselNewValue,
                          )
                        : VesselDrop(
                            listItems: contVess.vesselList,
                            notifyParent: (value) {
                              setState(() {
                                contVess.vesselNewValue = value;
                              });
                              contVoyage.selectedvalue = null;
                              contVoyage.getVoyageApi(value);
                            },
                          )),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeightText(
                            text: "Voyage",
                            size: 18.sp,
                            color: AppColor.textColor),
                        Obx(() => contVoyage.voyageList.isEmpty
                            ? VoyageDown(
                                notifyparent: (value) {
                                  setState(() {
                                    contVoyage.selectedvalue = value;
                                  });
                                },
                                listItems: contVoyage.voyageList,
                              )
                            : VoyageDown(
                                notifyparent: (value) {
                                  setState(() {
                                    contVoyage.selectedvalue = value;
                                  });
                                },
                                listItems: contVoyage.voyageList,
                                selectedValue: contVoyage.selectedvalue,
                              ))
                      ],
                    ),
                    SizeBox.customHeight(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const LoadingListUpdateScreen());
                          },
                          child: Container(
                            height: 60.h,
                            width: MediaQuery.of(context).size.width * 0.75,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.refresh_outlined,
                                ),
                                SizeBox.customWidth(5.w),
                                WeightText(
                                    text: "Refresh",
                                    size: 18.sp,
                                    color: Colors.black),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(9.r)),
                          ),
                        ),
                      ],
                    ),
                    SizeBox.customHeight(10.h),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// buildRefreshOnLoadSheet() {
//   LoadingListController loadController = Get.put(LoadingListController());
//
//   return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5.w),
//       child: Container(
//           padding: EdgeInsets.all(5.r),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(9.r.r),
//           ),
//           height: 400.h,
//           child: FutureBuilder(
//               future: loadController.getLoadingDataApi(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       itemCount: loadController.loadingDataList.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           shadowColor: Colors.orange,
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(15.r))),
//                           child: ExpansionTile(
//                             title: Text(
//                               'Port : ${snapshot.data[index].port}'
//                               "   "
//                               'Size : ${snapshot.data[index].size}',
//                               style: TextStyle(fontSize: 15.sp),
//                             ),
//                             subtitle: Text(
//                               'FPOD : ${snapshot.data[index].fpod}'
//                               "   "
//                               'Type: ${snapshot.data[index].type}',
//                               style: TextStyle(fontSize: 15.sp),
//                             ),
//                             leading: IconButton(
//                               icon: const Icon(Icons.edit),
//                               onPressed: () {},
//                             ),
//                             // controlAffinity:
//                             //     ListTileControlAffinity
//                             //         .leading,
//                             trailing: Text(snapshot.data[index].container,
//                                 style: TextStyle(fontSize: 15.sp)),
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 8.h, horizontal: 8.w),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               SemiWeighText(
//                                                 text: "Weight",
//                                                 size: 12.sp,
//                                                 color: Colors.black,
//                                               ),
//                                               TextField(
//                                                 expands: false,
//                                                 decoration: InputDecoration(
//                                                     hintText: snapshot
//                                                         .data[index].weight
//                                                         .toString(),
//                                                     border: OutlineInputBorder(
//                                                         borderSide:
//                                                             const BorderSide(
//                                                                 width: 2.0,
//                                                                 style:
//                                                                     BorderStyle
//                                                                         .solid,
//                                                                 color: Colors
//                                                                     .black),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                     9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizeBox.customWidth(5.w),
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               SemiWeighText(
//                                                 text: "IMCO",
//                                                 size: 12.sp,
//                                                 color: Colors.black,
//                                               ),
//                                               TextField(
//                                                 expands: false,
//                                                 decoration: InputDecoration(
//                                                     hintText: snapshot
//                                                         .data[index].imco,
//                                                     border: OutlineInputBorder(
//                                                         borderSide:
//                                                             const BorderSide(
//                                                                 width: 2.0,
//                                                                 style:
//                                                                     BorderStyle
//                                                                         .solid,
//                                                                 color: Colors
//                                                                     .black),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                     9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizeBox.customWidth(5.w),
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               SemiWeighText(
//                                                 text: "Status",
//                                                 size: 12.sp,
//                                                 color: Colors.black,
//                                               ),
//                                               TextField(
//                                                 expands: false,
//                                                 decoration: InputDecoration(
//                                                     hintText: snapshot
//                                                         .data[index].status,
//                                                     border: OutlineInputBorder(
//                                                         borderSide:
//                                                             const BorderSide(
//                                                                 width: 2.0,
//                                                                 style:
//                                                                     BorderStyle
//                                                                         .solid,
//                                                                 color: Colors
//                                                                     .black),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                     9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizeBox.customWidth(5.w),
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               SemiWeighText(
//                                                 text: "STOW",
//                                                 size: 12.sp,
//                                                 color: Colors.black,
//                                               ),
//                                               TextField(
//                                                 expands: false,
//                                                 decoration: InputDecoration(
//                                                     hintText: snapshot
//                                                         .data[index].stow,
//                                                     border: OutlineInputBorder(
//                                                         borderSide:
//                                                             const BorderSide(
//                                                                 width: 2.0,
//                                                                 style:
//                                                                     BorderStyle
//                                                                         .solid,
//                                                                 color: Colors
//                                                                     .black),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                     9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizeBox.customWidth(5.w),
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               SemiWeighText(
//                                                 text: "Remark",
//                                                 size: 12.sp,
//                                                 color: Colors.black,
//                                               ),
//                                               TextField(
//                                                 expands: false,
//                                                 decoration: InputDecoration(
//                                                     hintText: snapshot
//                                                         .data[index].remark,
//                                                     border: OutlineInputBorder(
//                                                         borderSide:
//                                                             const BorderSide(
//                                                                 width: 2.0,
//                                                                 style:
//                                                                     BorderStyle
//                                                                         .solid,
//                                                                 color: Colors
//                                                                     .black),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                     9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizeBox.customWidth(5.w),
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               SemiWeighText(
//                                                 text: "Transportation",
//                                                 size: 12.sp,
//                                                 color: Colors.black,
//                                               ),
//                                               TextField(
//                                                 expands: false,
//                                                 decoration: InputDecoration(
//                                                     hintText: snapshot
//                                                         .data[index].trans,
//                                                     border: OutlineInputBorder(
//                                                         borderSide:
//                                                             const BorderSide(
//                                                                 width: 2.0,
//                                                                 style:
//                                                                     BorderStyle
//                                                                         .solid,
//                                                                 color: Colors
//                                                                     .black),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                     9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       });
//                 } else if (snapshot.connectionState ==
//                     ConnectionState.waiting) {
//                   return Center(
//                       child: SemiWeighText(
//                     text: "Waiting...",
//                     color: AppColor.textColor,
//                     size: 13.sp,
//                   ));
//                 } else if (snapshot.connectionState == ConnectionState.none) {
//                   return Center(
//                       child: SemiWeighText(
//                     text: "Can't Connect to Server...",
//                     color: AppColor.textColor,
//                     size: 13.sp,
//                   ));
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               })));
// }

// Obx(
//                       () => Visibility(
//                           visible: loadController.isVisible.value,
//                           child: Container(
//                               padding: EdgeInsets.all(5.r),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(9.r),
//                               ),
//                               height: 400.h,
//                               child: Column(
//                                 children: [
//                                   if (loadController.isVisible.value)
//                                     FutureBuilder(
//                                         future:
//                                             loadController.getLoadingDataApi(),
//                                         builder: (BuildContext context,
//                                             AsyncSnapshot snapshot) {
//                                           if (snapshot.hasData) {
//                                             return ListView.builder(
//                                                 shrinkWrap: true,
//                                                 scrollDirection: Axis.vertical,
//                                                 itemCount: loadController
//                                                     .loadingDataList.length,
//                                                 itemBuilder: (context, index) {
//                                                   return Card(
//                                                     shadowColor: Colors.orange,
//                                                     elevation: 5,
//                                                     shape: RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     15.sp.r))),
//                                                     child: ExpansionTile(
//                                                       title: Text(
//                                                         'Port : ${snapshot.data[index].port}'
//                                                         "   "
//                                                         'Size : ${snapshot.data[index].size}',
//                                                         style: TextStyle(
//                                                             fontSize: 15.sp.sp),
//                                                       ),
//                                                       subtitle: Text(
//                                                         'FPOD : ${snapshot.data[index].fpod}'
//                                                         "   "
//                                                         'Type: ${snapshot.data[index].type}',
//                                                         style: TextStyle(
//                                                             fontSize: 15.sp.sp),
//                                                       ),
//                                                       leading: IconButton(
//                                                         icon: const Icon(
//                                                             Icons.edit),
//                                                         onPressed: () {},
//                                                       ),
//                                                       // controlAffinity:
//                                                       //     ListTileControlAffinity
//                                                       //         .leading,
//                                                       trailing: Text(
//                                                           snapshot.data[index]
//                                                               .container,
//                                                           style: TextStyle(
//                                                               fontSize: 15.sp.sp)),
//                                                       children: [
//                                                         Padding(
//                                                           padding: EdgeInsets
//                                                               .symmetric(
//                                                                   vertical: 8.h,
//                                                                   horizontal:
//                                                                       8.w),
//                                                           child: Column(
//                                                             children: [
//                                                               Row(
//                                                                 children: [
//                                                                   Expanded(
//                                                                     child:
//                                                                         Column(
//                                                                       children: [
//                                                                         SemiWeighText(
//                                                                           text:
//                                                                               "Weight",
//                                                                           size:
//                                                                               12.sp,
//                                                                           color:
//                                                                               Colors.black,
//                                                                         ),
//                                                                         TextField(
//                                                                           expands:
//                                                                               false,
//                                                                           decoration: InputDecoration(
//                                                                               hintText: snapshot.data[index].weight.toString(),
//                                                                               border: OutlineInputBorder(borderSide: const BorderSide(width: 2.0, style: BorderStyle.solid, color: Colors.black), borderRadius: BorderRadius.circular(9.r))),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                   SizeBox
//                                                                       .customWidth(
//                                                                           5.w),
//                                                                   Expanded(
//                                                                     child:
//                                                                         Column(
//                                                                       children: [
//                                                                         SemiWeighText(
//                                                                           text:
//                                                                               "IMCO",
//                                                                           size:
//                                                                               12.sp,
//                                                                           color:
//                                                                               Colors.black,
//                                                                         ),
//                                                                         TextField(
//                                                                           expands:
//                                                                               false,
//                                                                           decoration: InputDecoration(
//                                                                               hintText: snapshot.data[index].imco,
//                                                                               border: OutlineInputBorder(borderSide: const BorderSide(width: 2.0, style: BorderStyle.solid, color: Colors.black), borderRadius: BorderRadius.circular(9.r))),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                   SizeBox
//                                                                       .customWidth(
//                                                                           5.w),
//                                                                   Expanded(
//                                                                     child:
//                                                                         Column(
//                                                                       children: [
//                                                                         SemiWeighText(
//                                                                           text:
//                                                                               "Status",
//                                                                           size:
//                                                                               12.sp,
//                                                                           color:
//                                                                               Colors.black,
//                                                                         ),
//                                                                         TextField(
//                                                                           expands:
//                                                                               false,
//                                                                           decoration: InputDecoration(
//                                                                               hintText: snapshot.data[index].status,
//                                                                               border: OutlineInputBorder(borderSide: const BorderSide(width: 2.0, style: BorderStyle.solid, color: Colors.black), borderRadius: BorderRadius.circular(9.r))),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                               SizeBox
//                                                                   .customWidth(
//                                                                       5.w),
//                                                               Row(
//                                                                 children: [
//                                                                   Expanded(
//                                                                     child:
//                                                                         Column(
//                                                                       children: [
//                                                                         SemiWeighText(
//                                                                           text:
//                                                                               "STOW",
//                                                                           size:
//                                                                               12.sp,
//                                                                           color:
//                                                                               Colors.black,
//                                                                         ),
//                                                                         TextField(
//                                                                           expands:
//                                                                               false,
//                                                                           decoration: InputDecoration(
//                                                                               hintText: snapshot.data[index].stow,
//                                                                               border: OutlineInputBorder(borderSide: const BorderSide(width: 2.0, style: BorderStyle.solid, color: Colors.black), borderRadius: BorderRadius.circular(9.r))),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                   SizeBox
//                                                                       .customWidth(
//                                                                           5.w),
//                                                                   Expanded(
//                                                                     child:
//                                                                         Column(
//                                                                       children: [
//                                                                         SemiWeighText(
//                                                                           text:
//                                                                               "Remark",
//                                                                           size:
//                                                                               12.sp,
//                                                                           color:
//                                                                               Colors.black,
//                                                                         ),
//                                                                         TextField(
//                                                                           expands:
//                                                                               false,
//                                                                           decoration: InputDecoration(
//                                                                               hintText: snapshot.data[index].remark,
//                                                                               border: OutlineInputBorder(borderSide: const BorderSide(width: 2.0, style: BorderStyle.solid, color: Colors.black), borderRadius: BorderRadius.circular(9.r))),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                   SizeBox
//                                                                       .customWidth(
//                                                                           5.w),
//                                                                   Expanded(
//                                                                     child:
//                                                                         Column(
//                                                                       children: [
//                                                                         SemiWeighText(
//                                                                           text:
//                                                                               "Transportation",
//                                                                           size:
//                                                                               12.sp,
//                                                                           color:
//                                                                               Colors.black,
//                                                                         ),
//                                                                         TextField(
//                                                                           expands:
//                                                                               false,
//                                                                           decoration: InputDecoration(
//                                                                               hintText: snapshot.data[index].trans,
//                                                                               border: OutlineInputBorder(borderSide: const BorderSide(width: 2.0, style: BorderStyle.solid, color: Colors.black), borderRadius: BorderRadius.circular(9.r))),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                   );
//                                                 });
//                                           } else {
//                                             return SemiWeighText(
//                                                 text: "No Data",
//                                                 size: 18.0,
//                                                 color: AppColor.textColor);
//                                           }
//                                         }),
//                                 ],
//                               ))),
//                     ),

// Obx(() => Visibility(
//       visible: loadController.isVisible.value,
//       child: loadController.loadingDataList.isNotEmpty
//           ? Column(
//               children: [
//                 if (loadController.isVisible.value)
//                   Container(
//                     height: 500,
//                     padding: const EdgeInsets.all(1),
//                     decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.circular(9.r),
//                     ),
//                     child: ListView.builder(
//                         itemCount: loadController
//                             .loadingDataList.length,
//                         itemBuilder: (context, index) {
//                           return ExpansionTile(
//                             title: Text(
//                               'Port : ${loadController.loadingDataList[index].port}'
//                               "   "
//                               'Size : ${loadController.loadingDataList[index].size}',
//                               style: const TextStyle(
//                                   fontSize: 18.0),
//                             ),
//                             subtitle: Text(
//                               'FPOD : ${loadController.loadingDataList[index].fpod}'
//                               "   "
//                               "   "
//                               'Type: ${loadController.loadingDataList[index].type}',
//                               style: const TextStyle(
//                                   fontSize: 15.sp.sp),
//                             ),
//                             leading: IconButton(
//                               icon: const Icon(Icons.edit),
//                               onPressed: () {},
//                             ),
//                             controlAffinity:
//                                 ListTileControlAffinity
//                                     .leading,
//                             trailing: Text(
//                                 loadController
//                                     .loadingDataList[index]
//                                     .container
//                                     .toString(),
//                                 style: const TextStyle(
//                                     fontSize: 15.sp.sp)),
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets
//                                         .symmetric(
//                                     vertical: 8.0,
//                                     horizontal: 8),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               const NormalText(
//                                                 text:
//                                                     "Weight",
//                                                 size: 12.0,
//                                                 color: Colors
//                                                     .black,
//                                               ),
//                                               TextField(
//                                                 expands:
//                                                     false,
//                                                 decoration: InputDecoration(
//                                                     hintText: loadController
//                                                         .loadingDataList[
//                                                             index]
//                                                         .weight
//                                                         .toString(),
//                                                     border: OutlineInputBorder(
//                                                         borderSide: const BorderSide(
//                                                             width: 2.0,
//                                                             style: BorderStyle.solid,
//                                                             color: Colors.black),
//                                                         borderRadius: BorderRadius.circular(9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               const NormalText(
//                                                 text:
//                                                     "IMCO",
//                                                 size: 12.0,
//                                                 color: Colors
//                                                     .black,
//                                               ),
//                                               TextField(
//                                                 expands:
//                                                     false,
//                                                 decoration: InputDecoration(
//                                                     hintText: loadController
//                                                         .loadingDataList[
//                                                             index]
//                                                         .imco,
//                                                     border: OutlineInputBorder(
//                                                         borderSide: const BorderSide(
//                                                             width: 2.0,
//                                                             style: BorderStyle.solid,
//                                                             color: Colors.black),
//                                                         borderRadius: BorderRadius.circular(9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               const NormalText(
//                                                 text:
//                                                     "Status",
//                                                 size: 12.0,
//                                                 color: Colors
//                                                     .black,
//                                               ),
//                                               TextField(
//                                                 expands:
//                                                     false,
//                                                 decoration: InputDecoration(
//                                                     hintText: loadController
//                                                         .loadingDataList[
//                                                             index]
//                                                         .status,
//                                                     border: OutlineInputBorder(
//                                                         borderSide: const BorderSide(
//                                                             width: 2.0,
//                                                             style: BorderStyle.solid,
//                                                             color: Colors.black),
//                                                         borderRadius: BorderRadius.circular(9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               const NormalText(
//                                                 text:
//                                                     "STOW",
//                                                 size: 12.0,
//                                                 color: Colors
//                                                     .black,
//                                               ),
//                                               TextField(
//                                                 expands:
//                                                     false,
//                                                 decoration: InputDecoration(
//                                                     hintText: loadController
//                                                         .loadingDataList[
//                                                             index]
//                                                         .stow,
//                                                     border: OutlineInputBorder(
//                                                         borderSide: const BorderSide(
//                                                             width: 2.0,
//                                                             style: BorderStyle.solid,
//                                                             color: Colors.black),
//                                                         borderRadius: BorderRadius.circular(9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               const NormalText(
//                                                 text:
//                                                     "Remark",
//                                                 size: 12.0,
//                                                 color: Colors
//                                                     .black,
//                                               ),
//                                               TextField(
//                                                 expands:
//                                                     false,
//                                                 decoration: InputDecoration(
//                                                     hintText: loadController
//                                                         .loadingDataList[
//                                                             index]
//                                                         .remark,
//                                                     border: OutlineInputBorder(
//                                                         borderSide: const BorderSide(
//                                                             width: 2.0,
//                                                             style: BorderStyle.solid,
//                                                             color: Colors.black),
//                                                         borderRadius: BorderRadius.circular(9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Expanded(
//                                           child: Column(
//                                             children: [
//                                               const NormalText(
//                                                 text:
//                                                     "Transportation",
//                                                 size: 12.0,
//                                                 color: Colors
//                                                     .black,
//                                               ),
//                                               TextField(
//                                                 expands:
//                                                     false,
//                                                 decoration: InputDecoration(
//                                                     hintText: loadController
//                                                         .loadingDataList[
//                                                             index]
//                                                         .trans,
//                                                     border: OutlineInputBorder(
//                                                         borderSide: const BorderSide(
//                                                             width: 2.0,
//                                                             style: BorderStyle.solid,
//                                                             color: Colors.black),
//                                                         borderRadius: BorderRadius.circular(9.r))),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           );
//                         }),
//                   ),
//               ],
//             )
//           : Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 15.sp.sp),
//                 child: Column(
//                   children: [
//                     SemiWeighText(
//                         text: "No Data Found",
//                         size: 18.0,
//                         color: AppColor.textColor)
//                   ],
//                 ),
//               ),
//             ),
//     ))
