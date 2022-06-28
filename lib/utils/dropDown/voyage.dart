import 'package:flutter/material.dart';

class VoyageDown extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic selectedValue;
  final Function(dynamic value) notifyparent;

  const VoyageDown({
    Key? key,
    required this.listItems,
    this.selectedValue,
    required this.notifyparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            notifyparent(value);
          },
        ),
      ),
    );
  }
}
