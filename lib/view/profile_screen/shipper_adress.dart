import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Image.asset("assets/images/office.png",
                      fit: BoxFit.cover, height: 250.h),
                  WeightText(
                      text: " Address", size: 25.sp, color: AppColor.textColor),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15.h, left: 10.w, right: 10.w, bottom: 20.h),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            FutureBuilder(
                                future: profileController.getuserDetailsApi(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomField(
                                        hint: snapshot.data.add1);
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: SemiWeighText(
                                      text: "Waiting...",
                                      color: AppColor.textColor,
                                      size: 13.sp,
                                    ));
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.none) {
                                    return Center(
                                        child: SemiWeighText(
                                      text: "Can't Connect to Server...",
                                      color: AppColor.textColor,
                                      size: 13.sp,
                                    ));
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                            SizeBox.customHeight(15.h),
                            FutureBuilder(
                                future: profileController.getuserDetailsApi(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomField(
                                        hint: snapshot.data.add2);
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: SemiWeighText(
                                      text: "Waiting...",
                                      color: AppColor.textColor,
                                      size: 13.sp,
                                    ));
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.none) {
                                    return Center(
                                        child: SemiWeighText(
                                      text: "Can't Connect to Server...",
                                      color: AppColor.textColor,
                                      size: 13.sp,
                                    ));
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                            SizeBox.customHeight(15.h),
                            FutureBuilder(
                                future: profileController.getuserDetailsApi(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomField(
                                        hint: snapshot.data.add3);
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: SemiWeighText(
                                      text: "Waiting...",
                                      color: AppColor.textColor,
                                      size: 13.sp,
                                    ));
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.none) {
                                    return Center(
                                        child: SemiWeighText(
                                      text: "Can't Connect to Server...",
                                      color: AppColor.textColor,
                                      size: 13.sp,
                                    ));
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                            SizeBox.customHeight(15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: FutureBuilder(
                                      future:
                                          profileController.getuserDetailsApi(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          return CustomField(
                                              hint: snapshot.data.city);
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child: SemiWeighText(
                                            text: "Waiting...",
                                            color: AppColor.textColor,
                                            size: 13.sp,
                                          ));
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.none) {
                                          return Center(
                                              child: SemiWeighText(
                                            text: "Can't Connect to Server...",
                                            color: AppColor.textColor,
                                            size: 13.sp,
                                          ));
                                        } else {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      }),
                                ),
                                SizeBox.customWidth(15.w),
                                Expanded(
                                  child: FutureBuilder(
                                      future:
                                          profileController.getuserDetailsApi(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          return CustomField(
                                              hint: snapshot.data.state);
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child: SemiWeighText(
                                            text: "Waiting...",
                                            color: AppColor.textColor,
                                            size: 13.sp,
                                          ));
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.none) {
                                          return Center(
                                              child: SemiWeighText(
                                            text: "Can't Connect to Server...",
                                            color: AppColor.textColor,
                                            size: 13.sp,
                                          ));
                                        } else {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizeBox.customHeight(15.h),
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
                                          hint: snapshot.data.country);
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Waiting...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.none) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Can't Connect to Server...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            ),
                            SizeBox.customWidth(15.w),
                            Expanded(
                              child: FutureBuilder(
                                  future: profileController.getuserDetailsApi(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return CustomField(
                                          hint: snapshot.data.pincode);
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Waiting...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.none) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Can't Connect to Server...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            ),
                          ],
                        ),
                        SizeBox.customHeight(15.h),
                        Row(
                          children: [
                            Expanded(
                              child: FutureBuilder(
                                  future: profileController.getuserDetailsApi(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return CustomField(
                                          hint: snapshot.data.panno);
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Waiting...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.none) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Can't Connect to Server...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            )
                          ],
                        ),
                        SizeBox.customHeight(15.h),
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
                                          hint: snapshot.data.mobno);
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Waiting...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.none) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Can't Connect to Server...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            ),
                          ],
                        ),
                        SizeBox.customHeight(15.h),
                        Row(
                          children: [
                            Expanded(
                              child: FutureBuilder(
                                  future: profileController.getuserDetailsApi(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return CustomField(
                                          hint: snapshot.data.email);
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Waiting...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.none) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Can't Connect to Server...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            )
                          ],
                        ),
                        SizeBox.customHeight(15.h),
                        Row(
                          children: [
                            Expanded(
                              child: FutureBuilder(
                                  future: profileController.getuserDetailsApi(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return CustomField(
                                          hint: snapshot.data.email1);
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Waiting...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.none) {
                                      return Center(
                                          child: SemiWeighText(
                                        text: "Can't Connect to Server...",
                                        color: AppColor.textColor,
                                        size: 13.sp,
                                      ));
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
          ),
        ));
  }
}
