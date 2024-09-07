import 'package:aba_app/models/attempt.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

@JsonSerializable(
    includeIfNull: false) // include if null ignora quando esta null
class Application {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'protocol_id')
  final int protocolId;
  @JsonKey(name: 'positive_percentage')
  final double positivePercentage;
  @JsonKey(name: 'success')
  final int success;
  @JsonKey(name: 'failure')
  final int failure;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'created_by')
  final String createdBy;
  @JsonKey(name: 'aborted')
  final bool? aborted;
  @JsonKey(name: 'reason_abortion')
  final String? reasonAbortion;

  Application(
      {this.id,
      required this.protocolId,
      required this.positivePercentage,
      required this.success,
      required this.failure,
      required this.createdAt,
      required this.createdBy,
      required this.aborted,
      required this.reasonAbortion});

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

  @override
  String toString() {
    return 'Protocol(id: $id, protocol_id: $protocolId, positive_percentage: $positivePercentage, success: $success, failure: $failure, created_at: $createdAt, created_by: $createdBy, aborted: $aborted, reason_abortion: $reasonAbortion)';
  }
}
