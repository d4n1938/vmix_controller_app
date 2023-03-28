import 'package:http/http.dart' as http;

const String baseUrl = "http://";

class BaseClient {
  var client = http.Client();
  Future<dynamic> get(String ip, String port, String id) async {
    var url = Uri.parse("$baseUrl$ip:$port/api/");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> post(String api) async {}
}
