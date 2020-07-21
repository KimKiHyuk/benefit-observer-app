import 'package:json_annotation/json_annotation.dart';
part 'subscribe.g.dart';

@JsonSerializable()
class Subscribe {
  Subscribe({this.topic});

  String topic;

  factory Subscribe.fromJson(Map<String, dynamic> json) => _$SubscribeFromJson(json);
  Map<String, dynamic> toJson() => _$SubscribeToJson(this);

}


@JsonSerializable()
class PostSubscribes {
  PostSubscribes({this.subscribe, this.token});

  List<Subscribe> subscribe;
  String token;


  factory PostSubscribes.fromJson(Map<String, dynamic> json) => _$PostSubscribesFromJson(json);
  Map<String, dynamic> toJson() => _$PostSubscribesToJson(this);
}
