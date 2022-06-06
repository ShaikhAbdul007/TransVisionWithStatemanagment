import 'package:flutter/material.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class BookingSecondPage extends StatelessWidget {
  const BookingSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 13;
    final width = MediaQuery.of(context).size.width;
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
          Padding(
            padding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BoldText(
                      text: "Freight/Container ",
                      size: 18,
                      color: AppColor.textColor),
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColor.black,
                            style: BorderStyle.solid,
                            width: 2.0)),
                    child: const TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Enter Quantity",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BoldText(
                      text: "Weight/Cont in kgs. ",
                      size: 18,
                      color: AppColor.textColor),
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColor.black,
                            style: BorderStyle.solid,
                            width: 2.0)),
                    child: const TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Enter Weight/Cont in kgs.",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BoldText(
                      text: "Rate Agreed ", size: 18, color: AppColor.textColor),
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColor.black,
                            style: BorderStyle.solid,
                            width: 2.0)),
                    child: const TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Enter Rate Agreed By",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ))),
                SizeBox.customHeight(12),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.orange[300]),
                        child: const Center(
                          child: WeightText(
                              text: "All Record",
                              size: 20.0,
                              color: Colors.black),
                        )),
                  ),
                ),
                SizeBox.customHeight(12),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const Card(
                      child: ListTile(
                        title: Text("Abdul"),
                        leading: Icon(Icons.list),
                        trailing: Text(
                          "All record",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ],
            ),
          ),
          SizeBox.customHeight(12),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: (() {}),
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
          )
        ],
      ),
    );
  }
}
