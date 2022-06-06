import 'package:flutter/material.dart';
import 'package:tranvision_customer_app/utils/component/drawer.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("DAshBoard", style: TextStyle(fontSize: 30),)),
    drawer: MyDrawer(),
    );

  }
}
