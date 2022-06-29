import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/authController/login_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController logController = Get.put(LoginController());
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                left: 16.w,
              ),
              child: Image.asset(
                'assets/images/loginpage.png',
                fit: BoxFit.cover,
                height: 350.h,
              ),
            ),
            SizeBox.customHeight(15.h),
            BoldText(
                text: "Welcome To TransVision",
                size: 20.sp,
                color: AppColor.textColor),
            SizeBox.customHeight(15.h),
            Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Form(
                key: logController.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: logController.username,
                      validator: (value) =>
                          value!.isEmpty ? "User Name Cannot be Empty" : null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        prefixIcon: const Icon(CupertinoIcons.person_2_fill),
                        suffixIcon: logController.username.text.isEmpty
                            ? Container(
                                width: 0.w,
                              )
                            : IconButton(
                                onPressed: () {
                                  logController.username.clear();
                                },
                                icon: const Icon(Icons.close)),
                        hintText: "Enter UserName",
                        labelText: "User Name",
                        // labelStyle:
                        //     TextStyle(decorationColor: Colors.orange[800])
                      ),
                    ),
                    SizeBox.customHeight(15.h),
                    Obx(
                      () => TextFormField(
                        controller: logController.password,
                        obscureText: logController.isPasswordVisible.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.key),
                          suffixIcon: Obx(() => IconButton(
                              icon: logController.isPasswordVisible.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () => logController.toggle())),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) => value!.isEmpty
                            ? " password should not be empty "
                            : null,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizeBox.customHeight(15.h),
            InkWell(
              onTap: () {
                logController.checkLogin();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                height: 50.h,
                width: 200.w,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
