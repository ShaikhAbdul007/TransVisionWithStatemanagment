// To parse this JSON data, do
//
//     final type = typeFromJson(jsonString);

import 'dart:convert';

List<Type> typeFromJson(String str) =>
    List<Type>.from(json.decode(str).map((x) => Type.fromJson(x)));

String typeToJson(List<Type> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Type {
  Type({
    required this.code,
    required this.containerType,
  });

  String code;
  String containerType;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        code: json["code"],
        containerType: json["containerType"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "containerType": containerType,
      };
}
