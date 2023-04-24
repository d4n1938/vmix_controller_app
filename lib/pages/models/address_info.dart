import 'dart:convert';

AddressInfo addressInfoFromJson(String str) =>
    AddressInfo.fromJson(json.decode(str));

String addressInfoToJson(AddressInfo data) => json.encode(data.toJson());

class AddressInfo {
  AddressInfo({
    required this.ip,
    required this.port,
  });

  String ip;
  String port;

  factory AddressInfo.fromJson(Map<String, dynamic> json) => AddressInfo(
        ip: json["ip"],
        port: json["port"],
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
        "port": port,
      };
}
