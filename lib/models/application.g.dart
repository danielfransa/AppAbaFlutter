// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      id: (json['id'] as num?)?.toInt(),
      positivePercentage: (json['positivePercentage'] as num).toDouble(),
      success: (json['success'] as num).toInt(),
      failure: (json['failure'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      aborted: json['aborted'] as bool?,
      reasonAbortion: json['reasonAbortion'] as String?,
      attempts: (json['attempts'] as List<dynamic>)
          .map((e) => Attempt.fromJson(e as Map<String, dynamic>))
          .toList(),
      protocolId: (json['protocolId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['positivePercentage'] = instance.positivePercentage;
  val['success'] = instance.success;
  val['failure'] = instance.failure;
  val['createdBy'] = instance.createdBy;
  val['createdAt'] = instance.createdAt.toIso8601String();
  writeNotNull('aborted', instance.aborted);
  writeNotNull('reasonAbortion', instance.reasonAbortion);
  writeNotNull('protocolId', instance.protocolId);
  val['attempts'] = instance.attempts;
  return val;
}
