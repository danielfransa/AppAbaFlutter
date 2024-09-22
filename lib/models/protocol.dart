import 'package:json_annotation/json_annotation.dart';

part 'protocol.g.dart';

@JsonSerializable()
class Protocol {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'clientId')
  final int clientId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "createdBy")
  final String? createdBy;

  Protocol({
    required this.id,
    required this.clientId,
    required this.name,
    required this.createdBy,
  });

  factory Protocol.fromJson(Map<String, dynamic> json) =>
      _$ProtocolFromJson(json);

  Map<String, dynamic> toJson() => _$ProtocolToJson(this);
}
