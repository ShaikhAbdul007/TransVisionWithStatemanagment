/// icd : "INAMG"
/// icdname : "AMINGAON"

class Icdto {
  Icdto({
    String? icd,
    String? icdname,
  }) {
    _icd = icd;
    _icdname = icdname;
  }

  Icdto.fromJson(dynamic json) {
    _icd = json['icd'];
    _icdname = json['icdname'];
  }
  String? _icd;
  String? _icdname;
  Icdto copyWith({
    String? icd,
    String? icdname,
  }) =>
      Icdto(
        icd: icd ?? _icd,
        icdname: icdname ?? _icdname,
      );
  String? get icd => _icd;
  String? get icdname => _icdname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icd'] = _icd;
    map['icdname'] = _icdname;
    return map;
  }

  @override
  String toString() => '$_icdname';
}

// // To parse this JSON data, do
// //
// //     final icdTo = icdToFromJson(jsonString);
//
// import 'dart:convert';
//
// List<IcdTo> icdToFromJson(String str) =>
//     List<IcdTo>.from(json.decode(str).map((x) => IcdTo.fromJson(x)));
//
// String icdToToJson(List<IcdTo> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class IcdTo {
//   IcdTo({
//     required this.icd,
//     required this.icdname,
//   });
//
//   String icd;
//   String icdname;
//
//   factory IcdTo.fromJson(Map<String, dynamic> json) => IcdTo(
//         icd: json["icd"],
//         icdname: json["icdname"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "icd": icd,
//         "icdname": icdname,
//       };
// }
