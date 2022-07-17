import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IcdFrom extends StatelessWidget {
  final List<dynamic> listItems;
  final Function(dynamic value) notifyParent;
  final dynamic selectedIcdFromValue;

  const IcdFrom(
      {Key? key,
      required this.listItems,
      required this.notifyParent,
      required this.selectedIcdFromValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<dynamic>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          hintText: "Select",
          hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        // validator: ((value) => value == null ? "Selecte icd" : null),
        isExpanded: true,
        value: selectedIcdFromValue,
        style: const TextStyle(color: Colors.black),
        items: listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
          return DropdownMenuItem<dynamic>(
            value: item.icd,
            child: Text(item.icdname),
          );
        }).toList(),
        hint: Text(
          "Select",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        onChanged: (value) {
          notifyParent(value);
        },
      ),
    );
  }
}
