import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/myProfileController/shipper_profile_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/utilsController/drawer_Controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyDrawerController drawerController = Get.put(MyDrawerController());
    ShipperController shipperController = Get.find();
    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        color: Colors.orange[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: FutureBuilder(
                    future: shipperController.getuserDetailsApi(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return UserAccountsDrawerHeader(
                          margin: EdgeInsets.zero,
                          accountName: Text(snapshot.data.partyname.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          accountEmail: Text(
                            snapshot.data.email.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          currentAccountPicture: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })),
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
