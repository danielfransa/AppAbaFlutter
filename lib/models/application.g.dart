// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      id: (json['id'] as num?)?.toInt(),
      protocolId: (json['protocol_id'] as num).toInt(),
      positivePercentage: (json['positive_percentage'] as num).toDouble(),
      success: (json['success'] as num).toInt(),
      failure: (json['failure'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'] as String,
      aborted: json['aborted'] as bool?,
      reasonAbortion: json['reason_abortion'] as String?,
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'protocol_id': instance.protocolId,
      'positive_percentage': instance.positivePercentage,
      'success': instance.success,
      'failure': instance.failure,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by': instance.createdBy,
      'aborted': instance.aborted,
      'reason_abortion': instance.reasonAbortion,
    };
