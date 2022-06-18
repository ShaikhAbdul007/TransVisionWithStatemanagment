// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tranvision_customer_app/controller/myProfileController/profile_controller.dart';
// import 'package:tranvision_customer_app/utils/component/textfield_widget%20.dart';
// import 'package:tranvision_customer_app/utils/constant/colors.dart';
// import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
// import 'package:tranvision_customer_app/utils/constant/text.dart';

// class AddressPage extends StatelessWidget {
//   const AddressPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ProfileController profileController = Get.put(ProfileController());

//     return Scaffold(
//       appBar: AppBar(
//         title: WeightText(color: AppColor.black, text: 'Address', size: 20),
//         centerTitle: true,
//         elevation: 1.0,
//       ),
//       body: ListView(
//         children: [
//           Obx(() => profileController.isLoading.value
//               ? Column(
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 15, left: 10, right: 10),
//                       child: Column(
//                         children: [
//                           FutureBuilder(
//                               future: profileController.fetchUserDetailApi(),
//                               builder: (BuildContext context,
//                                   AsyncSnapshot snapshot) {
//                                 if (snapshot.hasData) {
//                                   return TextField(
//                                     readOnly: true,
//                                     decoration: InputDecoration(
//                                         hintText: snapshot.data.add1,
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                         )),
//                                   );
//                                 } else {
//                                   return const Center(
//                                       child: Text("Loading Data"));
//                                 }
//                               }),

//                           SizeBox.customHeight(15),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: FutureBuilder(
//                                     future:
//                                         profileController.fetchUserDetailApi(),
//                                     builder: (BuildContext context,
//                                         AsyncSnapshot snapshot) {
//                                       if (snapshot.hasData) {
//                                         return CustomField(
//                                             hint: snapshot.data.add2);
//                                       } else {
//                                         return const Center(
//                                             child: Text("Loading Data"));
//                                       }
//                                     }),
//                                 // CustomField(hint: 'profileController')
//                               ),
//                               SizeBox.customWidth(15),
//                               Expanded(
//                                 child: FutureBuilder(
//                                     future:
//                                         profileController.fetchUserDetailApi(),
//                                     builder: (BuildContext context,
//                                         AsyncSnapshot snapshot) {
//                                       if (snapshot.hasData) {
//                                         return CustomField(
//                                             hint: snapshot.data.add3);
//                                       } else {
//                                         return const Center(
//                                             child: Text("Loading Data"));
//                                       }
//                                     }),
//                                 // CustomField(hint: 'profileController')),
//                               )
//                             ],
//                           ),
//                           SizeBox.customHeight(15),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: FutureBuilder(
//                                     future:
//                                         ,
//                                     builder: (BuildContext context,
//                                         AsyncSnapshot snapshot) {
//                                       if (snapshot.hasData) {
//                                         return CustomField(
//                                             hint: snapshot.data.city);
//                                       } else {
//                                         return const Center(
//                                             child: Text("Loading Data"));
//                                       }
//                                     }),
//                                 // CustomField(hint: 'profileController')
//                               ),
//                               SizeBox.customWidth(15),
//                               Expanded(
//                                   child:
//                                       CustomField(hint: 'profileController')),
//                             ],
//                           ),
//                           SizeBox.customHeight(15),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child:
//                                       CustomField(hint: 'profileController')),
//                               SizeBox.customWidth(15),
//                               Expanded(
//                                   child:
//                                       CustomField(hint: 'profileController')),
//                             ],
//                           ),
//                           SizeBox.customHeight(15),
//                           const CustomField(
//                             hint: "Pan No",
//                           ),
//                           SizeBox.customHeight(15),
//                           CustomField(hint: 'profileController'),
//                           SizeBox.customHeight(15),
//                           CustomField(hint: 'profileController'),
//                           SizeBox.customHeight(15),
//                           CustomField(hint: 'profileController'),
//                           const SizedBox(height: 10),
//                           // GestureDetector(
//                           //   onTap: () => profileController.fetchUserDetailApi(),
//                           //   child: Container(
//                           //       width: 200,
//                           //       height: 50,
//                           //       alignment: Alignment.center,
//                           //       decoration: const BoxDecoration(color: Colors.red),
//                           //       child: const Text(
//                           //         "HIT API",
//                           //         style: TextStyle(
//                           //             fontSize: 20, fontWeight: FontWeight.bold),
//                           //       )),
//                           // ),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               : const Center(child: CircularProgressIndicator()))
//         ],
//       ),
//     );
//   }
// }
