// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscribe _$SubscribeFromJson(Map<String, dynamic> json) {
  return Subscribe(
    topic: json['topic'] as String,
  );
}

Map<String, dynamic> _$SubscribeToJson(Subscribe instance) => <String, dynamic>{
      'topic': instance.topic,
    };

PostSubscribes _$PostSubscribesFromJson(Map<String, dynamic> json) {
  return PostSubscribes(
    subscribe: (json['subscribe'] as List)
        ?.map((e) =>
            e == null ? null : Subscribe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$PostSubscribesToJson(PostSubscribes instance) =>
    <String, dynamic>{
      'subscribe': instance.subscribe,
      'token': instance.token,
    };
