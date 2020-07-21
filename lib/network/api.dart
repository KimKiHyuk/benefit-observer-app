import 'dart:convert';

import 'package:benefit_app/models/subscribe.dart';
import 'package:benefit_app/settings/constant.dart';
import 'package:http/http.dart' as http;

class API {

  static Future<List<Subscribe>> getSubscribes() async {

    var res = await http.get(GET_SUBSCRIBE_LIST, headers: {"Accept": "application/json"});

    return (json.decode(res.body) as List)
        .map((f) => Subscribe.fromJson(f))
        .toList();
  }

  static Future<List<Subscribe>> getUserSubscribes() async {
    var res = await http.get(SUBSCRIBE_API,
        headers: {"Accept": "application/json", "Authorization": "token"});

    return (json.decode(res.body) as List)
        .map((f) => Subscribe.fromJson(f))
        .toList();
  }

  static Future<http.Response> postSubscribe(PostSubscribes subscribes) async {
    print(subscribes.toString());
    return await http.post(SUBSCRIBE_API, headers: {
      "Accept": "application/json",
    }, body: subscribes.toJson());
  }

  static Future<http.Response> registerFCMToken(String token) async {
    return await http.post(REGISTER_API, headers: {
      "Accept": "application/json"
    }, body: {
      "Authorization": {"token": token}
    });
  }
}
