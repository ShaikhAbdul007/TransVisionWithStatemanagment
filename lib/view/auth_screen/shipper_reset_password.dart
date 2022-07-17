import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import '../../controller/authController/reset_password_controller.dart';

class ShipperResetPassword extends StatelessWidget {
  const ShipperResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordController pasController = Get.put(ResetPasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: [
          Column(
            children: [
              Image.asset(
                "assets/images/forgetpass.png",
                height: 250.h,
                fit: BoxFit.cover,
              ),
              WeightText(
                  text: "Change Your Password",
                  size: 25.sp,
                  color: AppColor.textColor),
              SizeBox.customHeight(15.h),
              Padding(
                padding: EdgeInsets.only(left: 12.w, right: 12.h, bottom: 5.h),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: pasController.rPKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: pasController.nPassword,
                        validator: (value) {
                          return pasController.validateNewPassword(value!);
                        },
                        decoration: InputDecoration(
                            suffixIcon: pasController.nPassword.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                    onPressed: () =>
                                        pasController.nPassword.clear(),
                                    icon: const Icon(Icons.close)),
                            labelText: "New Password",
                            hintText: "Enter New Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            )),
                      ),
                      SizeBox.customHeight(20.h),
                      TextFormField(
                        obscureText: !pasController.isVisible,
                        controller: pasController.cPassword,
                        validator: (value) {
                          return pasController.validateConfirmPassword(value!);
                        },
                        decoration: InputDecoration(
                            labelText: "Confirm Password",
                            hintText: "Enter Confirm Password",
                            suffixIcon: IconButton(
                                onPressed: () => pasController.isVisible =
                                    !pasController.isVisible,
                                icon: pasController.isVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            )),
                      ),
                      SizeBox.customHeight(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => pasController.checkSave(),
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.restart_alt_rounded,
                                  ),
                                  SizeBox.customWidth(8.w),
                                  WeightText(
                                      text: "Reset",
                                      size: 18.sp,
                                      color: Colors.black),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.primary!,
                                  borderRadius: BorderRadius.circular(7.r)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
