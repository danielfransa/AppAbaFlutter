// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Protocol _$ProtocolFromJson(Map<String, dynamic> json) => Protocol(
      id: (json['id'] as num).toInt(),
      clientId: (json['client_id'] as num).toInt(),
      name: json['name'] as String?,
      createBy: json['created_by'] as String?,
    );

Map<String, dynamic> _$ProtocolToJson(Protocol instance) => <String, dynamic>{
      'id': instance.id,
      'client_id': instance.clientId,
      'name': instance.name,
      'created_by': instance.createBy,
    };
