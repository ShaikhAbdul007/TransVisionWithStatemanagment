import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/utils_Controller/bottom_navigationController.dart';
import 'package:tranvision_customer_app/view/auth_screen/contacted_person.dart';
import 'package:tranvision_customer_app/view/auth_screen/reset_password.dart';
import 'package:tranvision_customer_app/view/profile_screen/address.dart';
import 'package:tranvision_customer_app/view/shipper_screen/dashboard_screen.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = [
      const DashBoard(),
      const AddressPage(),
      const ContactedPerson(),
      const ResetPassword(),
    ];
    MyBottomController navBottomController = Get.put(MyBottomController());
    return Scaffold(

      body: Obx(()=> IndexedStack(index: navBottomController.selectedIndex.value,children: screen)),
      bottomNavigationBar: Obx(
          ()=> BottomNavigationBar(
          onTap: (index){
            navBottomController.changeIndex(index);
          },
          currentIndex: navBottomController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.dashboard_outlined),
                label: "DashBoard",
                backgroundColor: Colors.orange[300]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.add_business_sharp),
                label: "Address",
                backgroundColor: Colors.orange[300]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.people_outline_sharp),
                label: "Contacted Person",
                backgroundColor: Colors.orange[300]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.lock),
                label: "Change Password",
                backgroundColor: Colors.orange[300]),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
