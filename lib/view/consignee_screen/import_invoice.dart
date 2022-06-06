import 'package:flutter/material.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';


class ImportInvoice extends StatelessWidget {
  const ImportInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: WeightText(color: AppColor.black, text: 'Import Invoice', size: 20),
        centerTitle: true,
        elevation: 1.0,
      ),
    );
  }
}
