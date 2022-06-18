// import 'package:get/get.dart';
// import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/commodity_controller/commodity_controller.dart';
// import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/icd_controller/newicdfrom_controller.dart';
// import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/icd_controller/newicdto_controller.dart';
// import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_controller/destination_controller.dart';
// import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/loading_controller/loading_controller.dart';
// import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/size/size_controller.dart';
// import 'package:tranvision_customer_app/controller/other_utils_Controller/dropdown_controller/type/type_controller.dart';

// import 'package:tranvision_customer_app/utils/dropDown/icd_from.dart';
// import 'package:tranvision_customer_app/utils/dropDown/icd_to.dart';

// class RemoteService {
//   SizeController sController = Get.put(SizeController());
//   CommodityController commodity = Get.put(CommodityController());
//   IcdNewFromController icdController = Get.put(IcdNewFromController());
//   IcdNewToController icdToController = Get.put(IcdNewToController());
//   LoadingController loadingController = Get.put(LoadingController());
//   DestinationController destinationController =
//       Get.put(DestinationController());

//   TypeController typeController = Get.put(TypeController());

//   var finalData get => {

//     IcdFrom=  icdFromValue,
//      IcdTo= icdToController.icdToValue,
//       loadingController  = loadingController.loadingPortValue,
//                         destinationController.destinationValue,
//                         c.controller.text,
//                         sController.selectedOption,
//                         typeController.selectedtype,
//                         commodity.commodityValue,
//   };

//    get icdFromValue => icdToController.icdToValue;
// }

// class finalData {
// }

class FinalData {
  String icdFrom;
  String icdTo;
  String pol;
  String pod;
  num qauntity;
  num size;
  String type;
  String commodity;
  String ourcas;
  String unno;
  String freight;
  String weight;
  String rateagreed;

  FinalData(
    this.icdFrom,
    this.icdTo,
    this.freight,
    this.weight,
    this.size,
    this.commodity,
    this.ourcas,
    this.pod,
    this.pol,
    this.qauntity,
    this.rateagreed,
    this.type,
    this.unno,
  );
}
