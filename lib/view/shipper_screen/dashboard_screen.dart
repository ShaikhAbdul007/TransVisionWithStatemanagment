import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/utils/component/drawer.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:tranvision_customer_app/view/shipper_screen/booking_screen/booking_page.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WeightText(color: AppColor.black, text: 'DashBoard', size: 20),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return const Card(
                  child: ListTile(
                    title: Text("Abdul"),
                    leading: Icon(Icons.list),
                    trailing: Text(
                      "All record",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    style: ListTileStyle.list,
                  ),
                );
              })),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const BookingPage());
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.library_books),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
