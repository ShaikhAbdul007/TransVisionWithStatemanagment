import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 0.0, left: 16.0, right: 0.0),
              child: Image.asset(
                'assets/images/loginpage.png',
                fit: BoxFit.cover,
                height: 350,
              ),
            ),
            SizeBox.customHeight(15),
            BoldText(
                text: "Welcome To TransVision",
                size: 20,
                color: AppColor.textColor),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: const Icon(CupertinoIcons.person_2_fill),
                        suffixIcon: logController.username.text.isEmpty
                            ? Container(
                                width: 0,
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
                    SizeBox.customHeight(15),
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
                              borderRadius: BorderRadius.circular(15)),
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
            SizeBox.customHeight(15),
            InkWell(
              onTap: () => logController.checkLogin(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(15)),
                child: const Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
