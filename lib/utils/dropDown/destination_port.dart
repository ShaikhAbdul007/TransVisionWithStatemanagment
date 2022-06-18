import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_controller/destination_controller.dart';

class DestinationPort extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic destinationValue;
  const DestinationPort(
      {Key? key, required this.listItems, this.destinationValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinationController destinationController =
        Get.put(DestinationController());
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          isExpanded: true,
          value: destinationValue,
          style: const TextStyle(color: Colors.black),
          items: listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item.port,
              child: Text(item.portname),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (value) {
            destinationController.destinationValue = value;
          },
        ),
      ),
    );
  }
}
