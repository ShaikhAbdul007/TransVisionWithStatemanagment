import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:tranvision_customer_app/view/shipper_screen/bill_of_landing/bl_details.dart';
import 'package:tranvision_customer_app/view/shipper_screen/bill_of_landing/home.dart';

class BillOfLading extends StatelessWidget {
  const BillOfLading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: WeightText(
                  color: AppColor.black, text: 'Bill Of Lading', size: 20.sp),
              centerTitle: true,
              elevation: 1.0,
              bottom: const TabBar(
                automaticIndicatorColorAdjustment: true,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "Details",
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Center(child: BlHome()),
                Center(child: BLDetails()),
              ],
              dragStartBehavior: DragStartBehavior.start,
              physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            )));
  }
}
