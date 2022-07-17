import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        validator: ((value) => value == null ? "Selecte type" : null),
        isExpanded: true,
        value: selectedType,
        style: const TextStyle(color: Colors.black),
        items: listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
          return DropdownMenuItem<dynamic>(
            value: item.code,
            child: Text(item.containerType),
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
          notifyparent(value);
        },
      ),
    );
  }
}
