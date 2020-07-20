import 'package:json_annotation/json_annotation.dart';
part 'subscribe.g.dart';

@JsonSerializable()
class Subscribe {
  Subscribe({this.title});

  String title;

  factory Subscribe.fromJson(Map<String, dynamic> json) => _$SubscribeFromJson(json);
  Map<String, dynamic> toJson() => _$SubscribeToJson(this);

}