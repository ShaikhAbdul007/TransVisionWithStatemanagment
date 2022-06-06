import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';

class MyDrawerController extends GetxController {
  Map<String, dynamic> get screen => {
        'Do Slip': {
          'routes': '/sds',
          'icon': Icon(
            Icons.collections_bookmark_rounded,
            color: AppColor.black,
            size: 25.0,
          )
        },
        'Bill Of Landing': {
          'routes': '/bfl',
          'icon': const Icon(
            Icons.adf_scanner,
            color: Colors.black,
            size: 25.0,
          ),
        },
        'Bill Summary': {
          'routes': '/bs',
          'icon': const Icon(
            Icons.summarize_rounded,
            color: Colors.black,
            size: 25.0,
          ),
        },
        'Loading List': {
          'routes': '/ll',
          'icon': const Icon(
            Icons.library_books_sharp,
            color: Colors.black,
            size: 25.0,
          ),
        },
        'Report': {
          'routes': '/br',
          'icon': const Icon(
            Icons.report_rounded,
            color: Colors.black,
            size: 25.0,
          ),
        },
        'Quotes': {
          'routes': '/rate',
          'icon': const Icon(
            Icons.bookmark_added_rounded,
            color: Colors.black,
            size: 25.0,
          ),
        },
      };
}
