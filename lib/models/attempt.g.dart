// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attempt _$AttemptFromJson(Map<String, dynamic> json) => Attempt(
      id: (json['id'] as num?)?.toInt(),
      help: json['help'] as String?,
      comments: json['comments'] as String?,
      attemptNumber: (json['attempt_number'] as num).toInt(),
      result: json['result'] as bool,
      applicationId: (json['application_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AttemptToJson(Attempt instance) => <String, dynamic>{
      'id': instance.id,
      'help': instance.help,
      'comments': instance.comments,
      'attempt_number': instance.attemptNumber,
      'result': instance.result,
      'application_id': instance.applicationId,
    };
