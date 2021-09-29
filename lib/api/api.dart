import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class API {
  static const _baseUrl = "https://api.agefans.app";

  static Future<Response> get(String url, {Map<String, dynamic>? body}) {
    if (body != null && body.length > 0) {
      url += "?";
      var i = 0;
      body.forEach((key, value) {
        url += "$key=$value";
        if (++i < body.length) {
          url += "&";
        }
      });
      print(url);
    }
    print(Uri.parse(_baseUrl + url));
    return http.get(Uri.parse(_baseUrl + url));
  }

  static Future<Response> post(String url) {
    return http.get(Uri.parse(_baseUrl + url));
  }
}
