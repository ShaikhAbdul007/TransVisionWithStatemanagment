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
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(width: 2.w, style: BorderStyle.solid)),
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
      ),
    );
  }
}
