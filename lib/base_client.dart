import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class BaseClient {
  String ip = "";
  String port = "";
  String baseUrl = "";

  BaseClient(this.ip, this.port) {
    baseUrl = "http://$ip:$port/api/";
  }
  var client = http.Client();

  Future<dynamic> get() async {
    var url = Uri.parse(baseUrl);
    var response = await client.get(url).catchError((err) => {print(err)});
    if (response.statusCode != 200) return;

    final myTransformer = Xml2Json();

    myTransformer.parse(response.body);
    var jsonResponse = myTransformer.toGData();
    Map<String, dynamic> data = json.decode(jsonResponse);

    return data["vmix"]["inputs"]["input"];
  }

  Future<dynamic> change(String api) async {
    var url = Uri.parse("$baseUrl?Function=OverlayInput1In&Input=$api");
    var response = await client.post(url).catchError((err) => {print(err)});
    return response;
  }
}
