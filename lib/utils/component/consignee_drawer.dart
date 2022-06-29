import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tranvision_customer_app/controller/myProfileController/consignee_profile_controller.dart';
import 'package:tranvision_customer_app/controller/other_utils_Controller/utilsController/consignee_drawer_controller.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';

class ConsigneeMyDrawer extends StatelessWidget {
  const ConsigneeMyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConsigneeDrawerController consigneeDrawerController =
        Get.put(ConsigneeDrawerController());
    ConsigneeController consigneeController = Get.find();

    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        color: AppColor.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: FutureBuilder(
                    future: consigneeController.getuserDetailsApi(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return UserAccountsDrawerHeader(
                          margin: EdgeInsets.zero,
                          accountName: Text(snapshot.data.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp)),
                          accountEmail: Text(
                            snapshot.data.email,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
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
            consigneeDrawerController.buildDrawerItem(
                text: "Security Invoice",
                icon: Icons.collections_bookmark_rounded,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => consigneeDrawerController.navigate(0)),
            consigneeDrawerController.buildDrawerItem(
                text: "Damage Invoice",
                icon: Icons.report,
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
                icon: Icons.summarize_rounded,
                textIconColor: Colors.black,
                tileColor: Colors.white,
                onTap: () => consigneeDrawerController.navigate(3)),
          ],
        ),
      ),
    );
  }
}
