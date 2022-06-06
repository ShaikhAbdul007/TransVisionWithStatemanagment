import 'dart:core';
import 'package:get/get.dart';

class BookingPageController extends GetxController {

  List<String> option = ['sad', 'happy', 'feeling low', 'feelings fine'];
  List<String> commodity = ['General', 'Hazardous', 'ODC'];

  RxList selectedOptionList = [].obs;

}
