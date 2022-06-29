import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tranvision_customer_app/controller/shipperController/dashboard_controller.dart';
import 'package:tranvision_customer_app/utils/component/Shipper_drawer.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';
import 'package:tranvision_customer_app/view/shipper_screen/booking_screen/booking_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..repeat();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(
        title: WeightText(color: AppColor.black, text: 'DashBoard', size: 20),
        centerTitle: true,
        elevation: 1.0,
        actions: [
          IconButton(
              onPressed: () async {
                Get.snackbar("Please Wait", "",
                    messageText: SemiWeighText(
                        text: "while loggin Out",
                        size: 18.0,
                        color: AppColor.textColor),
                    icon: const Icon(Icons.person_add_disabled,
                        color: Colors.white),
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.orangeAccent,
                    borderRadius: 15,
                    margin: const EdgeInsets.all(12),
                    colorText: AppColor.textColor,
                    duration: const Duration(seconds: 1),
                    isDismissible: true,
                    forwardAnimationCurve: Curves.easeOutBack,
                    dismissDirection: DismissDirection.horizontal);
                await Future.delayed(const Duration(seconds: 2));
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          PieChart(
            dataMap: const {
              "Total Port": 15,
              "Total Business": 20,
              "Total Transhipment": 30
            },
            animationDuration: const Duration(milliseconds: 1200),
            chartType: ChartType.disc,
            colorList: dashboardController.colorList,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            legendOptions:
                const LegendOptions(legendPosition: LegendPosition.left),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const BookingPage());
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.library_books),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
