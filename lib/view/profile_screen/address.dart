import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/myProfileController/profile_controller.dart';
import 'package:tranvision_customer_app/utils/component/textfield_widget%20.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: WeightText(color: AppColor.black, text: 'Address', size: 20),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Obx(() => profileController.isLoading.value
              ? Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: Column(
                        children: [
                          SizeBox.customHeight(15),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomField(
                                      hint: profileController
                                          .userDetails.data['add1'])),
                              SizeBox.customWidth(15),
                              Expanded(
                                child: CustomField(
                                    hint: profileController
                                        .userDetails.data['add2']),
                              )
                            ],
                          ),
                          SizeBox.customHeight(15),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomField(
                                      hint: profileController
                                          .userDetails.data['add3'])),
                              SizeBox.customWidth(15),
                              Expanded(
                                  child: CustomField(
                                      hint: profileController
                                          .userDetails.data['city'])),
                            ],
                          ),
                          SizeBox.customHeight(15),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomField(
                                      hint: profileController
                                          .userDetails.data['state'])),
                              SizeBox.customWidth(15),
                              Expanded(
                                  child: CustomField(
                                      hint: profileController
                                          .userDetails.data['country'])),
                            ],
                          ),
                          SizeBox.customHeight(15),
                          CustomField(
                            hint: profileController.userDetails.data['panno'],
                          ),
                          SizeBox.customHeight(15),
                          CustomField(
                              hint:
                                  profileController.userDetails.data['mobno']),
                          SizeBox.customHeight(15),
                          CustomField(
                              hint:
                                  profileController.userDetails.data['email']),
                          SizeBox.customHeight(15),
                          CustomField(
                              hint:
                                  profileController.userDetails.data['email1']),
                          const SizedBox(height: 10),
                          // GestureDetector(
                          //   onTap: () => profileController.fetchUserDetailApi(),
                          //   child: Container(
                          //       width: 200,
                          //       height: 50,
                          //       alignment: Alignment.center,
                          //       decoration: const BoxDecoration(color: Colors.red),
                          //       child: const Text(
                          //         "HIT API",
                          //         style: TextStyle(
                          //             fontSize: 20, fontWeight: FontWeight.bold),
                          //       )),
                          // ),
                        ],
                      ),
                    )
                  ],
                )
              : const Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}
