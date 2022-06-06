// /// icd : "INAMG"
// /// icdname : "AMINGAON"
//
// class Icdfrom {
//   Icdfrom({
//       String? icd,
//       String? icdname,}){
//     _icd = icd;
//     _icdname = icdname;
// }
//
//   Icdfrom.fromJson(dynamic json) {
//     _icd = json['icd'];
//     _icdname = json['icdname'];
//   }
//   String? _icd;
//   String? _icdname;
// Icdfrom copyWith({  String? icd,
//   String? icdname,
// }) => Icdfrom(  icd: icd ?? _icd,
//   icdname: icdname ?? _icdname,
// );
//   String? get icd => _icd;
//   String? get icdname => _icdname;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['icd'] = _icd;
//     map['icdname'] = _icdname;
//     return map;
//   }
//
// }

// To parse this JSON data, do
//
//     final icdFrom = icdFromFromJson(jsonString);

import 'dart:convert';

List<IcdFrom> icdFromFromJson(String str) => List<IcdFrom>.from(json.decode(str).map((x) => IcdFrom.fromJson(x)));

String icdFromToJson(List<IcdFrom> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IcdFrom {
  IcdFrom({
    required this.icd,
    required this.icdname,
  });

  String icd;
  String icdname;

  factory IcdFrom.fromJson(Map<String, dynamic> json) => IcdFrom(
    icd: json["icd"],
    icdname: json["icdname"],
  );

  Map<String, dynamic> toJson() => {
    "icd": icd,
    "icdname": icdname,
  };
}
