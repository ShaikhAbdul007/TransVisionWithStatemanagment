// /// port : "AEAUH"
// /// portname : "ABU DHABI PORT"

// class Loadingport {
//   Loadingport({
//       String? port,
//       String? portname,}){
//     _port = port;
//     _portname = portname;
// }

//   Loadingport.fromJson(dynamic json) {
//     _port = json['port'];
//     _portname = json['portname'];
//   }
//   String? _port;
//   String? _portname;
// Loadingport copyWith({  String? port,
//   String? portname,
// }) => Loadingport(  port: port ?? _port,
//   portname: portname ?? _portname,
// );
//   String? get port => _port;
//   String? get portname => _portname;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['port'] = _port;
//     map['portname'] = _portname;
//     return map;
//   }

// }

// To parse this JSON data, do
//
//     final loadingport = loadingportFromJson(jsonString);

// To parse this JSON data, do
//
//     final loadingPort = loadingPortFromJson(jsonString);

import 'dart:convert';

List<LoadingPort> loadingPortFromJson(String str) => List<LoadingPort>.from(
    json.decode(str).map((x) => LoadingPort.fromJson(x)));

String loadingPortToJson(List<LoadingPort> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoadingPort {
  LoadingPort({
    required this.port,
    required this.portname,
  });

  String port;
  String portname;

  factory LoadingPort.fromJson(Map<String, dynamic> json) => LoadingPort(
        port: json["port"],
        portname: json["portname"],
      );

  Map<String, dynamic> toJson() => {
        "port": port,
        "portname": portname,
      };
}
