import 'package:benefit_app/network/api.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  List<Map<String, dynamic>> list;
  int index;

  CheckboxWidget({this.list, this.index});

  @override
  State createState() {
    return _CheckboxWidget();
  }
}

class _CheckboxWidget extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: CheckboxListTile(
        title: Text(this.widget.list[this.widget.index]['topic']),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool val) {
          itemChange(val);
        },
        value: this.widget.list[this.widget.index]["check"],
      )),
    );
  }

  void itemChange(bool val) {
    setState(() {
      this.widget.list[this.widget.index]["check"] = val;
    });
  }
}
