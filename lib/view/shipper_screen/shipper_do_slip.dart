import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/s_do_slip_controller.dart';
import 'package:tranvision_customer_app/utils/component/textfield_widget%20.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class SDoSlip extends StatelessWidget {
  const SDoSlip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoSlip dController = Get.put(DoSlip());
    return Scaffold(
      appBar: AppBar(
        title:
            WeightText(color: AppColor.black, text: 'Delivery Order', size: 20),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/do.png",
                    fit: BoxFit.fill,
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeightText(
                            text: "From Date",
                            size: 18,
                            color: AppColor.textColor),
                        SizeBox.customHeight(8),
                        TextField(
                          controller: dController.doSlipFromDate,
                          decoration: InputDecoration(
                              hintText: "Select the date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  dController.chooseFromDate();
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              )),
                        ),
                        SizeBox.customHeight(10),
                        WeightText(
                            text: "To Date",
                            size: 18,
                            color: AppColor.textColor),
                        SizeBox.customHeight(8),
                        TextField(
                          controller: dController.doSlipToDate,
                          decoration: InputDecoration(
                              hintText: "Select the date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  dController.chooseToDate();
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              )),
                        ),
                        SizeBox.customHeight(8),
                        WeightText(
                            text: "Reference No",
                            size: 18,
                            color: AppColor.textColor),
                        SizeBox.customHeight(8),
                        const CustomField(
                          hint: 'Please Select Date',
                        ),
                        SizeBox.customHeight(20),
                        Center(
                          child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: BoldText(
                                color: AppColor.black,
                                text: 'Refresh',
                                size: 18.0,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
