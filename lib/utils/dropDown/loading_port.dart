import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingPort extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic loadingPortValue;
  final Function(dynamic value) notifyParent;
  const LoadingPort({
    Key? key,
    required this.listItems,
    required this.notifyParent,
    this.loadingPortValue,
  }) : super(key: key);

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
        validator: ((value) => value == null ? "Selecte pol" : null),
        isExpanded: true,
        value: loadingPortValue,
        style: const TextStyle(color: Colors.black),
        items: listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
          return DropdownMenuItem<dynamic>(
            value: item.port,
            child: Text(item.portname),
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
