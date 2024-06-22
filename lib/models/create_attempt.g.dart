// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAttempt _$CreateAttemptFromJson(Map<String, dynamic> json) =>
    CreateAttempt(
      help: json['help'] as String?,
      comments: json['comments'] as String?,
      attemptNumber: (json['attemptNumber'] as num).toInt(),
      result: json['result'] as bool,
    );

Map<String, dynamic> _$CreateAttemptToJson(CreateAttempt instance) =>
    <String, dynamic>{
      'help': instance.help,
      'comments': instance.comments,
      'attemptNumber': instance.attemptNumber,
      'result': instance.result,
    };
