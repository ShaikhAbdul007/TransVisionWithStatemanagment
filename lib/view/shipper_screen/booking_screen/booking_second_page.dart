import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/booking_controller/booking_page_controller.dart';
import 'package:tranvision_customer_app/post_model/NewPostModel.dart';
import 'package:tranvision_customer_app/utils/component/booking_list_item.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class BookingSecondPage extends StatelessWidget {
  const BookingSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 8.w, top: 10.h, right: 8.w),
        child: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, top: 10.h, bottom: 5.h),
                    child: SemiWeighText(
                        text: "Review Booking",
                        size: 20.sp,
                        color: AppColor.textColor),
                  ),
                  Obx(() => c.listOfModel.value.isNotEmpty
                      ? SizedBox(
                          height: 300,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: c.listOfModel.length,
                              itemBuilder: ((context, index) {
                                return BookingListItem(
                                    item: c.listOfModel[index]);
                              })),
                        )
                      : const Text("No Booking Yet")),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SemiWeighText(
                            text: "Add more",
                            size: 20.sp,
                            color: AppColor.textColor),
                        IconButton(
                            iconSize: 35.0,
                            icon: const Icon(Icons.add_box),
                            onPressed: () {
                              Get.back();
                              // Get.off(() => const BookingPage(
                              //
                              // ),);

                              // Get.offNamed('/book', arguments: false);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              SizeBox.customHeight(12.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 80,
                      width: 150,
                      child: InkWell(
                        onTap: (() async {
                          Get.defaultDialog(
                            buttonColor: AppColor.primary,
                            title: "Booking Confirmation",
                            content: Column(
                              children: const [
                                Text("Do You want To confirm the Booking ?")
                              ],
                            ),
                            barrierDismissible: false,
                            actions: [
                              ElevatedButton.icon(
                                  onPressed: () {
                                    // var response = await c.postData();
                                    Future.delayed(Duration.zero).then(
                                        (value) => Get.offAllNamed('/nav'));

                                    // Get.offAllNamed('/dashboard');
                                    // print(response);
                                  },
                                  icon: const Icon(Icons.thumb_up_sharp),
                                  label: const Text("Confirm")),
                              ElevatedButton.icon(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.thumb_down_sharp),
                                  label: const Text("Cancel"))
                            ],
                          );
                        }),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 1.w,
                          ),
                          height: 50.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.r),
                              color: AppColor.submit),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.black),
                              SizeBox.customWidth(5.w),
                              WeightText(
                                  text: "Submit",
                                  size: 18.sp,
                                  color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
