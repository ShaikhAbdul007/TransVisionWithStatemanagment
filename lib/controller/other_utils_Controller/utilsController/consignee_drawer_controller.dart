import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/view/consignee_screen/damage_invoice.dart';
import 'package:tranvision_customer_app/view/consignee_screen/detention_invoice.dart';
import 'package:tranvision_customer_app/view/consignee_screen/import_invoice.dart';
import 'package:tranvision_customer_app/view/consignee_screen/security_invoice.dart';

class ConsigneeDrawerController extends GetxController {
  navigate(int index) {
    switch (index) {
      case 0:
        Get.to(() => const SecurityInvoice());
        break;
      case 1:
        Get.to(() => const DamageInvoice());
        break;
      case 2:
        Get.to(() => const DetentionInvoice());
        break;
      case 3:
        Get.to(() => const ImportInvoice());
        break;
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
