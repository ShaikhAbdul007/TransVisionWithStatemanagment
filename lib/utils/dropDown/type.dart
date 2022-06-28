import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/type/type_controller.dart';

class Type extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic selectedType;
  final Function(dynamic value) notifyparent;
  const Type(
      {Key? key,
      required this.listItems,
      this.selectedType,
      required this.notifyparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TypeController typeController = Get.put(TypeController());
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          isExpanded: true,
          value: selectedType,
          style: const TextStyle(color: Colors.black),
          items: listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item.code,
              child: Text(item.containerType),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (value) {
            notifyparent(value);
          },
        ),
      ),
    );
  }
}
