import 'package:benefit_app/provider/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Views/WelcomeView.dart';

void main() {
  runApp(EntryPoint());
}

class EntryPoint extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Settings>(create: (_) => Settings())
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: WelcomeView(title: '게시판 공지글 감지앱'),
        ));
  }
}

