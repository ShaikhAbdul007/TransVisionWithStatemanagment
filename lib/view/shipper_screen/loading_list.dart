import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/loading_list_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/vessel_lis_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/voyage_lis_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:tranvision_customer_app/utils/dropDown/vaseel.dart';
import 'package:tranvision_customer_app/utils/dropDown/voyage.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VoyageController contVoyage = Get.put(VoyageController());
    VesselController contVess = Get.put(VesselController());
    LoadingListController loadController = Get.put(LoadingListController());
    return Scaffold(
      appBar: AppBar(
        title:
            WeightText(color: AppColor.black, text: 'Loading List', size: 20),
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
                height: 250.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeightText(
                        text: "Vessel", size: 18.0, color: AppColor.textColor),
                    Obx(() => contVess.vesselList.isNotEmpty
                        ? VesselDrop(
                            listItems: contVess.vesselList,
                            notifyParent: contVess.notifyUpdated)
                        : const Center(child: CircularProgressIndicator())),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeightText(
                            text: "Voyage",
                            size: 18.0,
                            color: AppColor.textColor),
                        Obx(() => contVoyage.voyageList.isEmpty
                            ? VoyageDown(
                                listItems: contVoyage.voyageList,
                              )
                            : VoyageDown(
                                listItems: contVoyage.voyageList,
                                selectedValue: contVoyage.selectedvalue,
                              ))
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            loadController.toggle();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.75,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.refresh_outlined,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                WeightText(
                                    text: "Refresh",
                                    size: 18,
                                    color: Colors.black),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(9)),
                          ),
                        ),
                      ],
                    ),
                    Obx(() => Visibility(
                          visible: loadController.isVisible.value,
                          child: loadController.loadingDataList.isNotEmpty
                              ? Column(
                                  children: [
                                    if (loadController.isVisible.value)
                                      Container(
                                        height: 500,
                                        padding: const EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        child: ListView.builder(
                                            itemCount: loadController
                                                .loadingDataList.length,
                                            itemBuilder: (context, index) {
                                              return ExpansionTile(
                                                title: Text(
                                                  'Port : ${loadController.loadingDataList[index].port}'
                                                  "   "
                                                  'Size : ${loadController.loadingDataList[index].size}',
                                                  style: const TextStyle(
                                                      fontSize: 18.0),
                                                ),
                                                subtitle: Text(
                                                  'FPOD : ${loadController.loadingDataList[index].fpod}'
                                                  "   "
                                                  "   "
                                                  'Type: ${loadController.loadingDataList[index].type}',
                                                  style: const TextStyle(
                                                      fontSize: 15.0),
                                                ),
                                                leading: IconButton(
                                                  icon: const Icon(Icons.edit),
                                                  onPressed: () {},
                                                ),
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                trailing: Text(
                                                    loadController
                                                        .loadingDataList[index]
                                                        .container
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 15.0)),
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 8),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  const NormalText(
                                                                    text:
                                                                        "Weight",
                                                                    size: 12.0,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  TextField(
                                                                    expands:
                                                                        false,
                                                                    decoration: InputDecoration(
                                                                        hintText: loadController
                                                                            .loadingDataList[
                                                                                index]
                                                                            .weight
                                                                            .toString(),
                                                                        border: OutlineInputBorder(
                                                                            borderSide: const BorderSide(
                                                                                width: 2.0,
                                                                                style: BorderStyle.solid,
                                                                                color: Colors.black),
                                                                            borderRadius: BorderRadius.circular(9))),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  const NormalText(
                                                                    text:
                                                                        "IMCO",
                                                                    size: 12.0,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  TextField(
                                                                    expands:
                                                                        false,
                                                                    decoration: InputDecoration(
                                                                        hintText: loadController
                                                                            .loadingDataList[
                                                                                index]
                                                                            .imco,
                                                                        border: OutlineInputBorder(
                                                                            borderSide: const BorderSide(
                                                                                width: 2.0,
                                                                                style: BorderStyle.solid,
                                                                                color: Colors.black),
                                                                            borderRadius: BorderRadius.circular(9))),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  const NormalText(
                                                                    text:
                                                                        "Status",
                                                                    size: 12.0,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  TextField(
                                                                    expands:
                                                                        false,
                                                                    decoration: InputDecoration(
                                                                        hintText: loadController
                                                                            .loadingDataList[
                                                                                index]
                                                                            .status,
                                                                        border: OutlineInputBorder(
                                                                            borderSide: const BorderSide(
                                                                                width: 2.0,
                                                                                style: BorderStyle.solid,
                                                                                color: Colors.black),
                                                                            borderRadius: BorderRadius.circular(9))),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  const NormalText(
                                                                    text:
                                                                        "STOW",
                                                                    size: 12.0,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  TextField(
                                                                    expands:
                                                                        false,
                                                                    decoration: InputDecoration(
                                                                        hintText: loadController
                                                                            .loadingDataList[
                                                                                index]
                                                                            .stow,
                                                                        border: OutlineInputBorder(
                                                                            borderSide: const BorderSide(
                                                                                width: 2.0,
                                                                                style: BorderStyle.solid,
                                                                                color: Colors.black),
                                                                            borderRadius: BorderRadius.circular(9))),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  const NormalText(
                                                                    text:
                                                                        "Remark",
                                                                    size: 12.0,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  TextField(
                                                                    expands:
                                                                        false,
                                                                    decoration: InputDecoration(
                                                                        hintText: loadController
                                                                            .loadingDataList[
                                                                                index]
                                                                            .remark,
                                                                        border: OutlineInputBorder(
                                                                            borderSide: const BorderSide(
                                                                                width: 2.0,
                                                                                style: BorderStyle.solid,
                                                                                color: Colors.black),
                                                                            borderRadius: BorderRadius.circular(9))),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  const NormalText(
                                                                    text:
                                                                        "Transportation",
                                                                    size: 12.0,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  TextField(
                                                                    expands:
                                                                        false,
                                                                    decoration: InputDecoration(
                                                                        hintText: loadController
                                                                            .loadingDataList[
                                                                                index]
                                                                            .trans,
                                                                        border: OutlineInputBorder(
                                                                            borderSide: const BorderSide(
                                                                                width: 2.0,
                                                                                style: BorderStyle.solid,
                                                                                color: Colors.black),
                                                                            borderRadius: BorderRadius.circular(9))),
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
                                              );
                                            }),
                                      ),
                                  ],
                                )
                              : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Column(
                                      children: [
                                        SemiWeighText(
                                            text: "No Data Found",
                                            size: 18.0,
                                            color: AppColor.textColor)
                                      ],
                                    ),
                                  ),
                                ),
                        ))
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
