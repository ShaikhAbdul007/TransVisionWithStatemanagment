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
    Controller controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: WeightText(
            color: AppColor.black, text: 'Booking Page', size: 20.sp),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  for (PostDataModel item in controller.listOfModel)
                    BookingListItem(
                      item: item,
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.h),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SemiWeighText(
                        text: "Add more",
                        size: 20.sp,
                        color: AppColor.textColor),
                    SizeBox.customWidth(10 * 20.sw),
                    Container(
                      // alignment: Alignment.center,
                      height: 40.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_right_alt_outlined),
                        onPressed: () {},
                      ),
                    ),
                    // IconButton(
                    //     iconSize: 35.0,
                    //     icon: const Icon(Icons.add_box),
                    //     onPressed: () {
                    //       );
                    //     }),
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
                    child: InkWell(
                  onTap: (() async {
                    var response = await c.postData();
                    Get.snackbar("Welcome Consignee", "",
                        messageText: SemiWeighText(
                            text: "Booking Done Successfully",
                            size: 18.sp,
                            color: AppColor.textColor),
                        showProgressIndicator: true,
                        icon:
                            const Icon(Icons.book_rounded, color: Colors.white),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.orangeAccent,
                        borderRadius: 15.r,
                        margin: EdgeInsets.all(12.r),
                        colorText: AppColor.textColor,
                        duration: const Duration(seconds: 2),
                        isDismissible: true,
                        forwardAnimationCurve: Curves.easeOutBack,
                        dismissDirection: DismissDirection.vertical);
                    // await Future.delayed(const Duration(seconds: 3));
                    // Get.to(() => const DashBoard());
                    print(response);
                  }),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 40.w,
                    ),
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.r),
                        color: AppColor.submit),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle, color: Colors.black),
                        SizeBox.customWidth(5.w),
                        WeightText(
                            text: "Submit", size: 18.sp, color: Colors.black),
                      ],
                    ),
                  ),
                )),
                SizeBox.customWidth(20.w),
                Expanded(
                    child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 40.w,
                    ),
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.r),
                        color: AppColor.cancel),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.close, color: Colors.black),
                        SizeBox.customWidth(20.w),
                        WeightText(
                            text: "Cancel", size: 18.sp, color: Colors.black),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
