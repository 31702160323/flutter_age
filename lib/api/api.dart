import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class API {
  static const _baseUrl = "api.agefans.app";

  static Future<Response> get(String url) {
    return http.get(Uri.https(_baseUrl, url));
  }

  static Future<Response> post(String url) {
    return http.get(Uri.https(_baseUrl, url));
  }
}