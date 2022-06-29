import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IcdTo extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic icdToValue;
  final Function(dynamic value) notifyParent;
  const IcdTo(
      {Key? key,
      required this.listItems,
      this.icdToValue,
      required this.notifyParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(width: 2.w, style: BorderStyle.solid)),
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
      ),
    );
  }
}
