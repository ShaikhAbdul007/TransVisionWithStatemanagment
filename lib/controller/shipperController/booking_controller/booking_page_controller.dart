import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/api_services/booking_api.dart';
import 'package:tranvision_customer_app/post_model/NewPostModel.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  TextEditingController freightcon = TextEditingController();
  TextEditingController weightcon = TextEditingController();
  TextEditingController rtag = TextEditingController();
  TextEditingController ourCount = TextEditingController();
  RxList listOfModel = <PostDataModel>[].obs;
  var data = Get.arguments;
  addListItem(data) {
    listOfModel.add(PostDataModel.fromJson(data));
  }

  removeListItem(index) {
    listOfModel.removeWhere((data) => data.id == index);
  }

  Future<String> postData() async {
    var body = List<Map<String, dynamic>>.from(
        listOfModel.map((element) => element.toJson()));
    var response = await http.post(Uri.parse((BookingApi.bookingApis)),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      // return BookingResDataModel.fromJson(data);
      return data[0]["result"];
    } else {
      throw Exception('Api Failed');
    }
  }
}
