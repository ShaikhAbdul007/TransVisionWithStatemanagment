import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/utilsController/conginee_bottom_controller.dart';
import 'package:tranvision_customer_app/view/auth_screen/contacted_person.dart';
import 'package:tranvision_customer_app/view/auth_screen/reset_password.dart';
import 'package:tranvision_customer_app/view/consignee_screen/do_slip.dart';
import 'package:tranvision_customer_app/view/profile_screen/address.dart';

class ConsigneeBottomNavigation extends StatelessWidget {
  const ConsigneeBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConsigneeBottomController consigneeController =
        Get.put(ConsigneeBottomController());
    final screen = [
      const CDoSlip(),
      // const AddressPage(),
      const ContactedPerson(),
      const ResetPassword(),
    ];
    return Scaffold(
      body: Obx(() => IndexedStack(
          index: consigneeController.selectedIndex.value, children: screen)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_outlined),
                  label: "DashBoard",
                  backgroundColor: Colors.orange),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_business_sharp),
                  label: "Address",
                  backgroundColor: Colors.orange),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline_sharp),
                  label: "Contacted Person",
                  backgroundColor: Colors.orange),
              BottomNavigationBarItem(
                icon: Icon(Icons.lock),
                label: "Reset Password",
                backgroundColor: Colors.orange,
              ),
            ],
            onTap: (index) {
              consigneeController.checkIndex(index);
            },
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            showSelectedLabels: false,
            selectedLabelStyle: const TextStyle(
                fontFamily: "poppins",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
