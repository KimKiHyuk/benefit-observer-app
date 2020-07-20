import 'dart:convert';

import 'package:benefit_app/models/subscribe.dart';
import 'package:benefit_app/settings/constant.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<List<Subscribe>> getSubscribes() async {
    var res = await http.get(SUBSCRIBE_API,
        headers: {"Accept": "application/json", "Authorization": "token"});

    return (json.decode(res.body)['subscribes'] as List)
        .map((f) => Subscribe.fromJson(f))
        .toList();
  }
}
