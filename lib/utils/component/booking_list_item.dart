import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/booking_controller/booking_page_controller.dart';
import 'package:tranvision_customer_app/post_model/NewPostModel.dart';

class BookingListItem extends StatelessWidget {
  final PostDataModel item;
  const BookingListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find();
    return Stack(
      children: [
        Card(
          shadowColor: Colors.orange,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.r))),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 10.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Icd From :" + item.icdfrom.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Icd To :" + item.icdto.toString())
                  ],
                ),
                Row(
                  children: [
                    Text("Loading Port :" + item.pol.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Destination Port :" + item.pod.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("Quantity:" + item.qty.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Size :" + item.size.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Type :" + item.type.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("Commodity :" + item.commodity.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Class :" + item.classs.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("Un No :" + item.unno.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Freight :" + item.freight.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("Weight :" + item.weight.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Rate Agreed :" + item.rateagreedby.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 36.w * 10,
          child: IconButton(
              onPressed: () {
                controller.removeListItem(item);
              },
              icon: const Icon(Icons.cancel_outlined)),
        )
      ],
    );
  }
}
