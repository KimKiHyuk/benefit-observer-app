import 'package:benefit_app/settings/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings with ChangeNotifier {
  String fcmtok;
  SharedPreferences _prefs;

  Future<void> setFcm(String token) async {
    if (this.fcmtok != token) {
      this.fcmtok = token;
      await this._prefs.setString(FCM_TOKEN, fcmtok);
      print('fcm token set : ${this.fcmtok}');
    }
  }

  Future<void> initalizeSharedPreferences() async {
    print('init persistent memory start');
    this._prefs = await SharedPreferences.getInstance();
    this.fcmtok = this._prefs.getString(FCM_TOKEN) ?? '';
    print('init persistent memory end');
  }
}