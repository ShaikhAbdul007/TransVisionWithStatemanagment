import 'package:flutter/material.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
        height: 40,
        width: 100,
        child: Text(title),
      ),
    );
  }
}
