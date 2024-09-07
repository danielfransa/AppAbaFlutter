import 'package:json_annotation/json_annotation.dart';

part 'protocol.g.dart';

@JsonSerializable()
class Protocol {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'client_id')
  final int clientId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "created_by")
  final String? createBy;

  Protocol({
    required this.id,
    required this.clientId,
    required this.name,
    required this.createBy,
  });

  factory Protocol.fromJson(Map<String, dynamic> json) =>
      _$ProtocolFromJson(json);

  Map<String, dynamic> toJson() => _$ProtocolToJson(this);

  @override
  String toString() {
    return 'Protocol(id: $id, client_id: $clientId, name: $name, created_by: $createBy)';
  }
}
