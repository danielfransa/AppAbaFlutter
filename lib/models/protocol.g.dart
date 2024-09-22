// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Protocol _$ProtocolFromJson(Map<String, dynamic> json) => Protocol(
      id: (json['id'] as num).toInt(),
      clientId: (json['clientId'] as num).toInt(),
      name: json['name'] as String?,
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$ProtocolToJson(Protocol instance) => <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'name': instance.name,
      'createdBy': instance.createdBy,
    };
