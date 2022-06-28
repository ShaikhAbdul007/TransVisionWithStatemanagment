import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/myProfileController/shipper_profile_controller.dart';
import 'package:tranvision_customer_app/utils/component/textfield_widget%20.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class ShipperAddressPage extends StatelessWidget {
  const ShipperAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShipperController profileController = Get.put(ShipperController());
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Image.asset("assets/images/address.png",
                fit: BoxFit.cover, height: 150),
            WeightText(
                text: "Your Address", size: 25.0, color: AppColor.textColor),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, right: 10, bottom: 20),
              child: Column(
                children: [
                  Column(
                    children: [
                      FutureBuilder(
                          future: profileController.getuserDetailsApi(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return CustomField(hint: snapshot.data.add1);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: FutureBuilder(
                                future: profileController.getuserDetailsApi(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomField(
                                        hint: snapshot.data.add2);
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          ),
                          SizeBox.customHeight(15),
                          Expanded(
                            child: FutureBuilder(
                                future: profileController.getuserDetailsApi(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomField(
                                        hint: snapshot.data.add3);
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: FutureBuilder(
                                future: profileController.getuserDetailsApi(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomField(
                                        hint: snapshot.data.city);
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            child: FutureBuilder(
                                future: profileController.getuserDetailsApi(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomField(
                                        hint: snapshot.data.state);
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FutureBuilder(
                            future: profileController.getuserDetailsApi(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return CustomField(hint: snapshot.data.country);
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: FutureBuilder(
                            future: profileController.getuserDetailsApi(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return CustomField(hint: snapshot.data.pincode);
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FutureBuilder(
                            future: profileController.getuserDetailsApi(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return CustomField(hint: snapshot.data.panno);
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FutureBuilder(
                            future: profileController.getuserDetailsApi(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return CustomField(hint: snapshot.data.mobno);
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FutureBuilder(
                            future: profileController.getuserDetailsApi(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return CustomField(hint: snapshot.data.email);
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FutureBuilder(
                            future: profileController.getuserDetailsApi(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return CustomField(hint: snapshot.data.email1);
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
