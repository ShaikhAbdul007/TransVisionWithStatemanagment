import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/other_utils_Controller/dropdown_Controller/icdController/icdToController.dart';

class IcdTo extends StatelessWidget {
  final List<dynamic> listItems;
  const IcdTo({Key? key, required this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic selectedValue;
    IcdToController icdToController = Get.put(IcdToController());

    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          isExpanded: true,
          value: selectedValue,
          style: const TextStyle(color: Colors.black),
          items: listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item.icd,
              child: Text(item.icdname),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (dynamic value) {
            icdToController.setValue(value);
          },
        ),
      ),
    );
  }
}
