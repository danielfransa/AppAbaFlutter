import 'package:aba_app/models/attempt.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

@JsonSerializable(includeIfNull: false)
class Application {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'positivePercentage')
  final double positivePercentage;
  @JsonKey(name: 'success')
  final int success;
  @JsonKey(name: 'failure')
  final int failure;
  @JsonKey(name: 'createdBy')
  final String createdBy;
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @JsonKey(name: 'aborted')
  final bool? aborted;
  @JsonKey(name: 'reasonAbortion')
  final String? reasonAbortion;
  @JsonKey(name: 'protocolId')
  final int? protocolId;
  @JsonKey(name: 'attempts')
  final List<Attempt> attempts;

  Application(
      {this.id,
      required this.positivePercentage,
      required this.success,
      required this.failure,
      required this.createdAt,
      required this.createdBy,
      required this.aborted,
      required this.reasonAbortion,
      required this.attempts,
      this.protocolId});

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
