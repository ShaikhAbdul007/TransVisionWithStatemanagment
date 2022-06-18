import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/icd_controller/newicdto_controller.dart';

class IcdTo extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic icdToValue;
  const IcdTo({Key? key, required this.listItems, this.icdToValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IcdNewToController icdToController = Get.put(IcdNewToController());

    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          isExpanded: true,
          value: icdToValue,
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
          onChanged: (value) {
            icdToController.icdToValue = value;
          },
        ),
      ),
    );
  }
}
