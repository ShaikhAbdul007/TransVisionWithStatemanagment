import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_lis_controller/voyage_lis_controller.dart';

class VoyageDown extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic selectedValue;

  const VoyageDown({
    Key? key,
    required this.listItems,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VoyageController voyageController = Get.find();
    dynamic;
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
              value: item.voyage,
              child: Text(item.voyage),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (value) {
            voyageController.setValue(value);
          },
        ),
      ),
    );
  }
}
