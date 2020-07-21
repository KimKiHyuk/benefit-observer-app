import 'package:benefit_app/components/CheckboxWidget.dart';
import 'package:benefit_app/models/subscribe.dart';
import 'package:benefit_app/network/api.dart';
import 'package:flutter/material.dart';

class CheckboxListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Subscribe>>(
      future: API.getSubscribes(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<Map<String, dynamic>> checkList = List.generate(snapshot.data.length, (index){
          return {"topic" : snapshot.data[index].topic, "check" : false};
        });

        print(checkList);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxWidget(list: checkList, index: index);
                },
                itemCount: checkList.length,
              ),
            ),
            RaisedButton(
              child: Text("알람 구독하기"),
              onPressed: () async {
                PostSubscribes subscribes = new PostSubscribes(token: "token");
                checkList.forEach((element) {
                  if (element['check']) {
                    subscribes.subscribe.add(element['topic']);
                  }
                });

                var res = await API.postSubscribe(subscribes);

                print(res.statusCode);
              }
            )
          ],
        );
      }
    );
  }
}




