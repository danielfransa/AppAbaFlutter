// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateApplication _$CreateApplicationFromJson(Map<String, dynamic> json) =>
    CreateApplication(
      protocolId: (json['protocolId'] as num).toInt(),
      positivePercentage: (json['positivePercentage'] as num).toDouble(),
      success: (json['success'] as num).toInt(),
      failure: (json['failure'] as num).toInt(),
      createdBy: json['createdBy'] as String,
      aborted: json['aborted'] as bool?,
      reasonAbortion: json['reasonAbortion'] as String?,
      attempts: (json['attempts'] as List<dynamic>)
          .map((e) => CreateAttempt.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateApplicationToJson(CreateApplication instance) =>
    <String, dynamic>{
      'protocolId': instance.protocolId,
      'positivePercentage': instance.positivePercentage,
      'success': instance.success,
      'failure': instance.failure,
      'createdBy': instance.createdBy,
      'aborted': instance.aborted,
      'reasonAbortion': instance.reasonAbortion,
      'attempts': instance.attempts,
    };
