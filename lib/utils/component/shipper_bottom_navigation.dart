import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/view/auth_screen/shipper_contacted_person.dart';
import 'package:tranvision_customer_app/view/auth_screen/shipper_reset_password.dart';
import 'package:tranvision_customer_app/view/profile_screen/shipper_adress.dart';
import 'package:tranvision_customer_app/view/shipper_screen/dashboard_screen.dart';
import '../../controller/other_utils_Controller/utilsController/bottom_navigation_controller.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = [
      const DashBoard(),
      const ShipperAddressPage(),
      const ShipperContactedPerson(),
      const ShipperResetPassword(),
    ];
    MyBottomController navBottomController = Get.put(MyBottomController());
    return Scaffold(
      body: Obx(() => IndexedStack(
          index: navBottomController.selectedIndex.value, children: screen)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            navBottomController.changeIndex(index);
          },
          currentIndex: navBottomController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined),
                label: "DashBoard",
                backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_business_sharp),
                label: "Address",
                backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline_sharp),
              label: "Contacted",
              backgroundColor: Colors.orangeAccent,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock),
                label: "Password",
                backgroundColor: Colors.orangeAccent),
          ],
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          showSelectedLabels: false,
          selectedLabelStyle: const TextStyle(
              fontFamily: "poppins",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(
              fontFamily: "poppins",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
