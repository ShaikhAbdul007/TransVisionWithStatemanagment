import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/utilsController/conginee_bottom_controller.dart';
import 'package:tranvision_customer_app/view/consignee_screen/auth_screen/contacted%20_person.dart';
import 'package:tranvision_customer_app/view/consignee_screen/auth_screen/reset_password.dart';
import 'package:tranvision_customer_app/view/consignee_screen/do_slip.dart';
import 'package:tranvision_customer_app/view/profile_screen/consignee_address.dart';

class ConsigneeBottomNavigation extends StatelessWidget {
  const ConsigneeBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = [
      const CDoSlip(),
      const AddressPage(),
      const ConsigneeContactedPerson(),
      const ConsigneeResetPassword(),
    ];
    ConsigneeBottomController consigneeBottomController =
        Get.put(ConsigneeBottomController());
    return Scaffold(
        body: Obx(() => IndexedStack(
              index: consigneeBottomController.selectedIndex.value,
              children: screen,
            )),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              onTap: (index) {
                consigneeBottomController.changeIndex(index);
              },
              currentIndex: consigneeBottomController.selectedIndex.value,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections_bookmark_rounded),
                    label: "DoSlip",
                    backgroundColor: Colors.orange),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_business_sharp),
                    label: "Address",
                    backgroundColor: Colors.orange),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people_outline_sharp),
                    label: "Contacted",
                    backgroundColor: Colors.orange),
                BottomNavigationBarItem(
                  icon: Icon(Icons.lock),
                  label: "Password",
                  backgroundColor: Colors.orange,
                ),
              ],
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              showSelectedLabels: false,
              selectedLabelStyle: const TextStyle(
                  fontFamily: "poppins",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            )));
  }
}
