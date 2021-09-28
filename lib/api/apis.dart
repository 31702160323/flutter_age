import 'package:http/http.dart';

import 'api.dart';

Future<Response> getSlipic() {
  return API.get('/v2/slipic');
}

Future<Response> getHomeList() {
  return API.get('/v2/home-list');
}

Future<Response> getRank() {
  return API.get('/v2/rank');
}

Future<Response> getVideo(String AID) {
  return API.get('/v2/detail/${AID}');
}

Future<Response> search() {
  return API.get('/v2/search');
}