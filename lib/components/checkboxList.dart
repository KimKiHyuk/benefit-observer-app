import 'package:benefit_app/components/CheckboxWidget.dart';
import 'package:flutter/material.dart';

class CheckboxListWidget extends StatelessWidget {
  var li = [{"title": "hello", "check": false}, {"title": "world", "check": false}];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CheckboxWidget(list: li, index: index);
      },
      itemCount: 2,
    );
  }
}




