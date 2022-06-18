import 'package:flutter/material.dart';

class Commodity extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic commodityValue;
  final Function(dynamic value) notifyParent;
  const Commodity(
      {Key? key,
      required this.listItems,
      required this.notifyParent,
      this.commodityValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // dynamic selectedOptionList;
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          isExpanded: true,
          value: commodityValue,
          style: const TextStyle(color: Colors.black),
          items: listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item,
              child: Text("$item"),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (value) {
            notifyParent(value);
          },
        ),
      ),
    );
  }
}