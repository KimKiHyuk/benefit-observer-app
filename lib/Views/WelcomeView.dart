import 'dart:io';

import 'package:benefit_app/network/api.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:benefit_app/provider/settings.dart';
import 'package:provider/provider.dart';

import 'ManageView.dart';


class WelcomeView extends StatefulWidget {
  WelcomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomeView createState() => _WelcomeView();
}

class _WelcomeView extends State<WelcomeView> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<bool>(
            future: initalize(),
            builder: (context,  AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              else {
                return ManageView();
              }
            }
        ),
      ),
    );
  }


  Future<bool> initalize() async {
    Settings settings = Provider.of<Settings>(context, listen: false);

    try {
      await settings.initalizeSharedPreferences();
      await firebaseCloudMessaging_Listeners(settings);
    } on Error catch(error) {
      print(error);
      return false;
    }

    await Future.delayed(const Duration(seconds: 1), () {});
    await API.registerFCMToken(settings.fcmtok); // login

    return true;
  }

  Future<void> firebaseCloudMessaging_Listeners(Settings settings) async {
    print('init firebase start');
    if (Platform.isIOS) iOS_Permission();

    final token = await _firebaseMessaging.getToken();
    settings.setFcm(token);

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        await firebaseForeGroundCallback(message);
      },
      onResume: (Map<String, dynamic> message) async {
        // only for android

        await firebaseBackGroundCallback(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        // only for ios
        await firebaseBackGroundCallback(message);
      },
    );
    print('init firebase end');
  }

  Future<void> firebaseForeGroundCallback(Map<String, dynamic> message) async {
    var data = message['data'] ?? message;
    print(data);
  }

  Future<void> firebaseBackGroundCallback(Map<String, dynamic> message) async {
    var data = message['data'] ?? message;
    print("background");
    print(data);
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
}