import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/booking_controller/booking_page_controller.dart';
import 'package:tranvision_customer_app/post_model/NewPostModel.dart';
import 'package:tranvision_customer_app/utils/component/booking_list_item.dart';
import 'package:tranvision_customer_app/utils/component/shipper_bottom_navigation.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:tranvision_customer_app/view/shipper_screen/booking_screen/booking_page.dart';
import 'package:tranvision_customer_app/view/shipper_screen/dashboard_screen.dart';

class BookingSecondPage extends StatelessWidget {
  const BookingSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    Controller controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            WeightText(color: AppColor.black, text: 'Booking Page', size: 20),
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
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SemiWeighText(
                        text: "Add more", size: 20, color: AppColor.textColor),
                    SizeBox.customWidth(10 * 20),
                    Container(
                      // alignment: Alignment.center,
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(15)),
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
          SizeBox.customHeight(12),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: (() async {
                    var response = await c.postData();
                    Get.snackbar("Welcome Consignee", "",
                        messageText: SemiWeighText(
                            text: "Booking Done Successfully",
                            size: 18,
                            color: AppColor.textColor),
                        showProgressIndicator: true,
                        icon:
                            const Icon(Icons.book_rounded, color: Colors.white),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.orangeAccent,
                        borderRadius: 15,
                        margin: const EdgeInsets.all(12),
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
                    padding: const EdgeInsets.only(
                      left: 40.0,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.green[300]),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.check_circle, color: Colors.black),
                        SizedBox(
                          width: 5.0,
                        ),
                        WeightText(
                            text: "Submit", size: 18.0, color: Colors.black),
                      ],
                    ),
                  ),
                )),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.red[900]),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.close, color: Colors.black),
                        SizedBox(
                          width: 5.0,
                        ),
                        WeightText(
                            text: "Cancel", size: 18.0, color: Colors.black),
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
