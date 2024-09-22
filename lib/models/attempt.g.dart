// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attempt _$AttemptFromJson(Map<String, dynamic> json) => Attempt(
      id: (json['id'] as num).toInt(),
      attemptNumber: (json['attemptNumber'] as num).toInt(),
      help: json['help'] as String?,
      comments: json['comments'] as String?,
      result: json['result'] as bool,
    );

Map<String, dynamic> _$AttemptToJson(Attempt instance) => <String, dynamic>{
      'id': instance.id,
      'attemptNumber': instance.attemptNumber,
      'help': instance.help,
      'comments': instance.comments,
      'result': instance.result,
    };
