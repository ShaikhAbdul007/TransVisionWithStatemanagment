import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/utilsController/consignee_drawer_controller.dart';

class ConsigneeMyDrawer extends StatelessWidget {
  const ConsigneeMyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConsigneeDrawerController consigneeDrawerController =
        Get.put(ConsigneeDrawerController());

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
            consigneeDrawerController.buildDrawerItem(
                text: "Security Invoice",
                icon: Icons.collections_bookmark_rounded,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => consigneeDrawerController.navigate(0)),
            consigneeDrawerController.buildDrawerItem(
                text: "Damage Invoice",
                icon: Icons.summarize_rounded,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => consigneeDrawerController.navigate(1)),
            consigneeDrawerController.buildDrawerItem(
                text: "Detention Invoice",
                icon: Icons.library_books_sharp,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => consigneeDrawerController.navigate(2)),
            consigneeDrawerController.buildDrawerItem(
                text: "Import Invoice",
                icon: Icons.report,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => consigneeDrawerController.navigate(3)),
          ],
        ),
      ),
    );
  }
}
