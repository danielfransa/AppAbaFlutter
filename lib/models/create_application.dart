import 'package:aba_app/models/attempt.dart';
import 'package:aba_app/models/create_attempt.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_application.g.dart';

@JsonSerializable()
class CreateApplication {
  @JsonKey(name: 'protocolId')
  final int protocolId;
  @JsonKey(name: 'positivePercentage')
  final double positivePercentage;
  @JsonKey(name: 'success')
  final int success;
  @JsonKey(name: 'failure')
  final int failure;
  @JsonKey(name: 'createdBy')
  final String createdBy;
  @JsonKey(name: 'aborted')
  final bool? aborted;
  @JsonKey(name: 'reasonAbortion')
  final String? reasonAbortion;
  @JsonKey(name: 'attempts')
  final List<CreateAttempt> attempts;

  CreateApplication(
      {required this.protocolId,
      required this.positivePercentage,
      required this.success,
      required this.failure,
      required this.createdBy,
      required this.aborted,
      required this.reasonAbortion,
      required this.attempts});

  factory CreateApplication.fromJson(Map<String, dynamic> json) =>
      _$CreateApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$CreateApplicationToJson(this);

  @override
  String toString() {
    return 'Protocol(protocolId: $protocolId, positivePercentage: $positivePercentage, success: $success, failure: $failure,  createdBy: $createdBy, aborted: $aborted, reasonAbortion: $reasonAbortion)';
  }
}
