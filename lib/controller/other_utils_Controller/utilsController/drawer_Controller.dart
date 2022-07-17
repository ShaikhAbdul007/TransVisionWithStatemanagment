import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/view/shipper_screen/bill_of_landing/bill_of_lading.dart';
import 'package:tranvision_customer_app/view/shipper_screen/bill_summary.dart';
import 'package:tranvision_customer_app/view/shipper_screen/booking_report.dart';
import 'package:tranvision_customer_app/view/shipper_screen/loading_list/loading_list.dart';
import 'package:tranvision_customer_app/view/shipper_screen/shipper_do_slip.dart';

class MyDrawerController extends GetxController {
  navigate(int index) {
    switch (index) {
      case 0:
        Get.to(() => const SDoSlip());
        break;
      case 1:
        Get.to(() => const BillSummary());
        break;
      case 2:
        Get.to(() => const LoadingList());
        break;
      case 3:
        Get.to(() => const BookingReport());
        break;
      case 4:
        Get.to(()=> const BillOfLading());
    }
  }

  buildDrawerItem(
      {required String text,
      required IconData icon,
      required Color textIconColor,
      required Color tileColor,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(text,
          style: const TextStyle(
              fontFamily: "poppins",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold)),
      tileColor: tileColor,
      onTap: onTap,
    );
  }
}
