// To parse this JSON data, do
//
//     final destinationPort = destinationPortFromJson(jsonString);

import 'dart:convert';

List<DestinationPort> destinationPortFromJson(String str) =>
    List<DestinationPort>.from(
        json.decode(str).map((x) => DestinationPort.fromJson(x)));

String destinationPortToJson(List<DestinationPort> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DestinationPort {
  DestinationPort({
    required this.port,
    required this.portname,
  });

  String port;
  String portname;

  factory DestinationPort.fromJson(Map<String, dynamic> json) =>
      DestinationPort(
        port: json["port"],
        portname: json["portname"],
      );

  Map<String, dynamic> toJson() => {
        "port": port,
        "portname": portname,
      };
}
