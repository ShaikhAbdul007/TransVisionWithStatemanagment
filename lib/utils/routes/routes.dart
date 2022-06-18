import 'package:get/get.dart';
import 'package:tranvision_customer_app/utils/component/shipper_bottom_navigation.dart';
import 'package:tranvision_customer_app/utils/component/drawer.dart';
import 'package:tranvision_customer_app/view/auth_screen/login_screen.dart';
import 'package:tranvision_customer_app/view/auth_screen/reset_password.dart';
import 'package:tranvision_customer_app/view/consignee_screen/damage_invoice.dart';
import 'package:tranvision_customer_app/view/consignee_screen/detention_invoice.dart';
import 'package:tranvision_customer_app/view/consignee_screen/do_slip.dart';
import 'package:tranvision_customer_app/view/consignee_screen/import_invoice.dart';
import 'package:tranvision_customer_app/view/consignee_screen/security_invoice.dart';
import 'package:tranvision_customer_app/view/profile_screen/address.dart';
import 'package:tranvision_customer_app/view/shipper_screen/bill_of_landing/bl_details.dart';
import 'package:tranvision_customer_app/view/shipper_screen/bill_of_landing/home.dart';
import 'package:tranvision_customer_app/view/shipper_screen/bill_summary.dart';
import 'package:tranvision_customer_app/view/shipper_screen/booking_report.dart';
import 'package:tranvision_customer_app/view/shipper_screen/booking_screen/booking_page.dart';
import 'package:tranvision_customer_app/view/shipper_screen/booking_screen/booking_second_page.dart';
import 'package:tranvision_customer_app/view/shipper_screen/dashboard_screen.dart';
import 'package:tranvision_customer_app/view/shipper_screen/loading_list.dart';
import 'package:tranvision_customer_app/view/shipper_screen/shipper_do_slip.dart';

class MyRoutes {
  static final routes = [
    GetPage(name: "/login", page: () => const LoginPage()),
    GetPage(name: "/reset", page: () => const ResetPassword()),
    // GetPage(name: "/address", page: () => const AddressPage()),
    GetPage(name: "/sds", page: () => const SDoSlip()),
    GetPage(name: "/ll", page: () => const LoadingList()),
    GetPage(name: "/bs", page: () => const BillSummary()),
    GetPage(name: "/br", page: () => const BookingReport()),
    GetPage(name: "/blh", page: () => const BlHome()),
    GetPage(name: "/bld", page: () => const BLDetails()),
    GetPage(name: "/import", page: () => const ImportInvoice()),
    GetPage(name: "/security", page: () => const SecurityInvoice()),
    GetPage(name: "/detention", page: () => const DetentionInvoice()),
    GetPage(name: "/damage", page: () => const DamageInvoice()),
    GetPage(name: "/cds", page: () => const CDoSlip()),
    GetPage(name: "/drawer", page: () => const MyDrawer()),
    GetPage(name: "/dash", page: () => const DashBoard()),
    GetPage(name: "/nav", page: () => const MyBottomNavigation()),
    GetPage(name: "/book", page: () => const BookingPage()),
    GetPage(name: "/booking", page: () => const BookingSecondPage()),
  ];
}
