import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/view/profile_screen/consignee_address.dart';

class DashboardController extends GetxController {
  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  final logoutKey = GlobalKey();
  final drawerKey = GlobalKey();
  final bookingKey = GlobalKey();
  final addressKey = GlobalKey();
  final resetPasswordKey = GlobalKey();
}
