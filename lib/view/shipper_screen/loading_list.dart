import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                                selectedValue: contVoyage.updatedSelectedValue,
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
                            // showModalBottomSheet(
                            //     context: context,
                            //     builder: (context) => buildSheet());
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
