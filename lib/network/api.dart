import 'dart:convert';

import 'package:benefit_app/models/subscribe.dart';
import 'package:benefit_app/services/AuthService.dart';
import 'package:benefit_app/settings/constant.dart';
import 'package:http/http.dart' as http;

class APIService {
  AuthService authService;

  APIService({this.authService});

  Future<List<Subscribe>> getSubscribes() async {
    var res = await http
        .get(GET_SUBSCRIBE_LIST, headers: {"Accept": "application/json"});

    return (json.decode(res.body) as List)
        .map((f) => Subscribe.fromJson(f))
        .toList();
  }

  Future<List<Subscribe>> getUserSubscribes() async {
    var res = await http.get(GET_USER_SUBSCRIBE_LIST_API, headers: {
      "Accept": "application/json",
      "Authorization": authService.getLocalFcmToken()
    });

    print(json.decode(res.body)["subscribes"]);
    return (json.decode(res.body) as List)
        .map((f) => Subscribe.fromJson(f))
        .toList();
  }

  Future<http.Response> postSubscribe(PostSubscribes subscribes) async {
    var payload = subscribes.toJson();
    payload["subscribes"] = List<String>();
    payload.remove("subscribe");

    subscribes.subscribe.forEach((element) {
      payload["subscribes"].add(element.topic);
    });

    return await http.post(SUBSCRIBE_API,
        headers: {
          "content-type": "application/json",
        },
        body: json.encode(payload));
  }

  Future<http.Response> registerFCMToken(String token) async {
    return await http.post(REGISTER_API,
        headers: {
          "content-type": "application/json",
        },
        body: json.encode({
          "Authorization": {"token": token}
        }));
  }
}
