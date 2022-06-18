import 'package:flutter/material.dart';

class VesselDrop extends StatelessWidget {
  final List<dynamic> listItems;
  final Function(dynamic value) notifyParent;
  const VesselDrop(
      {Key? key, required this.listItems, required this.notifyParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic selectedIcdFromValue;
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          isExpanded: true,
          value: selectedIcdFromValue,
          style: const TextStyle(color: Colors.black),
          items: listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item.vessel,
              child: Text(item.vessel),
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
