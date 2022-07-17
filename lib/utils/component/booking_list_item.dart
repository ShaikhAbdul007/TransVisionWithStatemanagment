import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/booking_controller/booking_page_controller.dart';
import 'package:tranvision_customer_app/post_model/NewPostModel.dart';

class BookingListItem extends StatefulWidget {
  final PostDataModel item;
  const BookingListItem({Key? key, required this.item}) : super(key: key);

  @override
  State<BookingListItem> createState() => _BookingListItemState();
}

class _BookingListItemState extends State<BookingListItem> {
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
                    Text("Icd From : " + widget.item.icdfrom.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Icd To : " + widget.item.icdto.toString())
                  ],
                ),
                Row(
                  children: [
                    Text("Loading Port :" + widget.item.pol.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Destination Port :" + widget.item.pod.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("Quantity: " + widget.item.qty.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Size : " + widget.item.size.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Type : " + widget.item.type.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("Commodity : " + widget.item.commodity.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Class : " + widget.item.classs.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("Un No : " + widget.item.unno.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text("Freight : " + widget.item.freight.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("Weight : " + widget.item.weight.toString()),
                    const Icon(Icons.arrow_right_alt_outlined),
                    Text(
                        "Rate Agreed : " + widget.item.rateagreedby.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 5.0,
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: IconButton(
                onPressed: () {
                  controller.removeListItem(widget.item);
                },
                icon: const Icon(Icons.delete_forever_outlined, size: 30.0),
              )),
        )
      ],
    );
  }
}
