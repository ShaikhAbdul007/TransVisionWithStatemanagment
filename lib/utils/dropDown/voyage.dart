import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
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
