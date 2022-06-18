import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tranvision_customer_app/api_services/api_services.dart';
import 'package:tranvision_customer_app/post_model/online_insert_post_model.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  TextEditingController freightcon = TextEditingController();
  TextEditingController weightcon = TextEditingController();
  TextEditingController rtag = TextEditingController();
  TextEditingController ourCount = TextEditingController();
  List<PostDataModel> postmodel = [];
  RxBool isVisibleRecord = false.obs;
  showAllRecord() {
    isVisibleRecord.value = true;
  }

  Future<List<PostDataModel>> postData(
      dynamic partycode,
      dynamic icd,
      dynamic icdto,
      dynamic pol,
      dynamic pod,
      dynamic qty,
      dynamic size,
      dynamic type,
      dynamic commodity,
      dynamic clas,
      dynamic unno,
      dynamic weight,
      dynamic freight,
      dynamic rateagreedby) async {
    var response = await http.post(Uri.parse((ApiServices.bookingApis)), body: {
      'partycode': partycode,
      'icdfrom': icd,
      'icdto': icdto,
      'pol': pol,
      'pod': pod,
      'qty': qty,
      'rateagreedby': rateagreedby,
      'size': size,
      'type': type,
      'unno': unno,
      'weight': weight,
      'freight': freight,
      'commodity ': commodity,
      'classs': clas,
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        postmodel.add(PostDataModel.fromJson(i));
      }
      return postmodel;
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
