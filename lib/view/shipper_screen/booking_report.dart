import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/booking_report_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class BookingReport extends StatelessWidget {
  const BookingReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingReportController bookController = Get.put(BookingReportController());
    return Scaffold(
      appBar: AppBar(
        title:
            WeightText(color: AppColor.black, text: 'Booking Report', size: 20),
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
                    "assets/images/reports.png",
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
                          controller: bookController.bookingFromDate,
                          decoration: InputDecoration(
                              hintText: "Select the date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  bookController.chooseFromDate();
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
                          controller: bookController.bookingToDate,
                          decoration: InputDecoration(
                              hintText: "Select the date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  bookController.chooseToDate();
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              )),
                        ),
                        SizeBox.customHeight(8),
                        WeightText(
                            text: "Reference No",
                            size: 18,
                            color: AppColor.textColor),
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
