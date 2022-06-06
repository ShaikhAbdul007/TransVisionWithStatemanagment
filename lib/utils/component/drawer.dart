import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/other_utils_Controller/utilsController/drawer_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyDrawerController drawerController = Get.put(MyDrawerController());

    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        color: Colors.orange[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("contactperson",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                accountEmail: Text(
                  "email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),
            ),
            drawerController.buildDrawerItem(
                text: "Delivery Order",
                icon: Icons.collections_bookmark_rounded,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => drawerController.navigate(0)),
            drawerController.buildDrawerItem(
                text: "Bill Summary",
                icon: Icons.summarize_rounded,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => drawerController.navigate(1)),
            drawerController.buildDrawerItem(
                text: "Loading List",
                icon: Icons.library_books_sharp,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => drawerController.navigate(2)),
            drawerController.buildDrawerItem(
                text: "Booking Report",
                icon: Icons.report,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => drawerController.navigate(3)),
            drawerController.buildDrawerItem(
                text: "Bill Of Lading",
                icon: Icons.adf_scanner,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => drawerController.navigate(4)),
            drawerController.buildDrawerItem(
                text: "Quick Quotes",
                icon: Icons.bookmark_added_rounded,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => drawerController.navigate(5))
          ],
        ),
      ),
    );
  }
}
