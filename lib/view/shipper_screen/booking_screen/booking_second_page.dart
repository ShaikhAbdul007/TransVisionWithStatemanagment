import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/shipperController/booking_controller/booking_page_controller.dart';
import 'package:tranvision_customer_app/shared_preferences/shared_preference.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class BookingSecondPage extends StatelessWidget {
  const BookingSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    final height = MediaQuery.of(context).size.height / 11;
    final width = MediaQuery.of(context).size.width;
    var postInsertModel = Get.arguments;

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
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10),
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
                SizeBox.customHeight(3),
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
                    child: TextField(
                        controller: c.freightcon,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: "Enter Quantity",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ))),
                SizeBox.customHeight(7),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BoldText(
                      text: "Weight/Cont in kgs. ",
                      size: 18,
                      color: AppColor.textColor),
                ),
                SizeBox.customHeight(3),
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
                    child: TextField(
                        controller: c.weightcon,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: "Enter Weight/Cont in kgs.",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ))),
                SizeBox.customHeight(7),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BoldText(
                      text: "Rate Agreed ",
                      size: 18,
                      color: AppColor.textColor),
                ),
                SizeBox.customHeight(3),
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
                    child: TextField(
                        controller: c.rtag,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: "Enter Rate Agreed By",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ))),
                SizeBox.customHeight(12),
                InkWell(
                  onTap: () {
                    c.showAllRecord();
                  },
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
                Obx(() => Visibility(
                    visible: c.isVisibleRecord.value,
                    child: SizedBox(
                        height: 200,
                        child: Card(
                          shadowColor: Colors.orange,
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              top: 10,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Icd From :" + postInsertModel[0]),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    Text("Icd To :" + postInsertModel[1])
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Loading Port :" + postInsertModel[2]),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    Text("Destination Port :" +
                                        postInsertModel[3]),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Quantity:" +
                                        postInsertModel[4].toString()),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    Text("Size :" +
                                        postInsertModel[5].toString()),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    Text("Type :" +
                                        postInsertModel[6].toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Commodity :" + postInsertModel[7]),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    Text("Class :" +
                                        postInsertModel[8].toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Un No :" +
                                        postInsertModel[9].toString()),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    Text("Freight :" +
                                        c.freightcon.text.toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Weight :" +
                                        c.weightcon.text.toString()),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    Text("Rate Agreed :" +
                                        c.rtag.text.toString()),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))))
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
                  onTap: (() {
                    UserLoginDetails user = UserLoginDetails();
                    var partycode = user.retrieveUserName();
                    c.postData(
                        partycode,
                        postInsertModel[0],
                        postInsertModel[1],
                        postInsertModel[2],
                        postInsertModel[3],
                        postInsertModel[4],
                        postInsertModel[5],
                        postInsertModel[6],
                        postInsertModel[7],
                        postInsertModel[8],
                        postInsertModel[9],
                        c.weightcon,
                        c.freightcon,
                        c.rtag);
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

// class FinalDetails {
//   // OnlineInsertPostModel post = OnlineInsertPostModel();
//   // post.;

// // dynamic finalData() {
// //   var data = Get.arguments;
// //   Controller controller = Get.find();
// //   OnlineInsertPostModel post = OnlineInsertPostModel();
// //   post.icdfrom != data[0];
// //   post.icdto != data[1];
// //   post.pol != data[2];
// //   post.pod != data[3];
// //   post.qty != data[4];
// //   post.size != data[5];
// //   post.type != data[6];
// //   post.commodity != data[7];
// //   post.classs != data[8];
// //   post.unno != data[9];
// //   post.freight != controller.freightcon;
// //   post.weight != controller.weightcon;
// //   post.rateagreedby != controller.rtag;
// // }

// // ListView.builder(
//   //     itemCount: c.allData.length,
//   //     scrollDirection: Axis.vertical,
//   //     shrinkWrap: true,
//   //     itemBuilder: (BuildContext context, int index) {
//   //       return Card(
//   //         shadowColor: Colors.orange,
//   //         elevation: 5,
//   //         shape: const RoundedRectangleBorder(
//   //             borderRadius:
//   //                 BorderRadius.all(Radius.circular(15))),
//   //         child: Padding(
//   //           padding: const EdgeInsets.only(
//   //               left: 15.0, top: 10, bottom: 10),
//   //           child: Column(
//   //             children: [
//   //               Row(
//   //                 children: [
//   //                   Text("Icd From :" + data[0]),
//   //                   const Icon(
//   //                       Icons.arrow_right_alt_outlined),
//   //                   Text("Icd To :" + data[1])
//   //                 ],
//   //               ),
//   //               Row(
//   //                 children: [
//   //                   Text("Loading Port :" + data[2]),
//   //                   const Icon(
//   //                       Icons.arrow_right_alt_outlined),
//   //                   Text("Destination Port :" + data[3]),
//   //                 ],
//   //               ),
//   //               Row(
//   //                 children: [
//   //                   Text("Quantity:" + data[4].toString()),
//   //                   const Icon(
//   //                       Icons.arrow_right_alt_outlined),
//   //                   Text("Size :" + data[5].toString()),
//   //                   const Icon(
//   //                       Icons.arrow_right_alt_outlined),
//   //                   Text("Type :" + data[6].toString()),
//   //                 ],
//   //               ),
//   //               Row(
//   //                 children: [
//   //                   Text("Commodity :" + data[7]),
//   //                   const Icon(
//   //                       Icons.arrow_right_alt_outlined),
//   //                   Text("Freight :" + c.freightcon.text),
//   //                 ],
//   //               ),
//   //               Row(
//   //                 children: [
//   //                   Text("Weight :" + c.weightcon.text),
//   //                   const Icon(
//   //                       Icons.arrow_right_alt_outlined),
//   //                   Text("Rate Agreed :" + c.rtag.text),
//   //                 ],
//   //               )
//   //             ],
//   //           ),
//   //         ),
//   //       );
//   //     })

// }
