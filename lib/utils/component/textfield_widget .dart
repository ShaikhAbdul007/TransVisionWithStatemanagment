import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';

class CustomField extends StatelessWidget {
  final dynamic hint;

  const CustomField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
          )),
    );
  }
}

class CustomerContainer extends StatelessWidget {
  final String text;
  const CustomerContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
            color: AppColor.black, width: 2.w, style: BorderStyle.solid),
      ),
      child: Text(text),
    );
  }
}
