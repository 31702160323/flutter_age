import 'package:http/http.dart';

import 'api.dart';

Future<Response> getSlipic() {
  return API.get('/v2/slipic');
}

Future<Response> getHomeList(Map<String, dynamic>? body) {
  return API.get('/v2/home-list?update=12&recommend=12', body: body);
}

Future<Response> getRank() {
  return API.get('/v2/rank');
}

Future<Response> getVideo(String aid) {
  return API.get('/v2/detail/$aid');
}

Future<Response> search() {
  return API.get('/v2/search');
}