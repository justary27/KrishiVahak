// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      id: json['id'] as String?,
      quote: json['quote'] as int,
      requestedAt: DateTime.parse(json['requestedAt'] as String),
      description: json['description'] as String,
      src: json['src'] as String,
      dest: json['dest'] as String,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'id': instance.id,
      'quote': instance.quote,
      'requestedAt': instance.requestedAt.toIso8601String(),
      'description': instance.description,
      'src': instance.src,
      'dest': instance.dest,
    };
