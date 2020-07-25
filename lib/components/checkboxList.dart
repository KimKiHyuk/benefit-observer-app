import 'package:benefit_app/components/CheckboxWidget.dart';
import 'package:benefit_app/models/subscribe.dart';
import 'package:benefit_app/network/api.dart';
import 'package:benefit_app/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class CheckboxListWidget extends StatelessWidget {
  APIService _apiServiceInstance;
  AuthService _authService;

  CheckboxListWidget(){
    this._authService = GetIt.instance<AuthService>();
    this._apiServiceInstance = GetIt.instance<APIService>();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Subscribe>>(
      future: this._apiServiceInstance.getSubscribes(),
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
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("구독"),
                    onPressed: () async {
                      PostSubscribes subscribes = new PostSubscribes(token: this._authService.getLocalFcmToken(), subscribe: new List<Subscribe>());
                      checkList.forEach((element) {
                        if (element['check']) {
                          subscribes.subscribe.add(Subscribe(topic:element['topic']));
                        }
                      });

                      var res = await this._apiServiceInstance.postSubscribe(subscribes);
                      if (res.statusCode != 201) {
                        print("subscribe post fail${res.statusCode}");
                      }
                      else {
                        print("Subscribe work has been doen");
                      }
                    }
                  ),
                ),

              ],
            ),
          ],
        );
      }
    );
  }
}




