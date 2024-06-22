import 'package:json_annotation/json_annotation.dart';

part 'attempt.g.dart';

@JsonSerializable()
class Attempt {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'help')
  final String? help;
  @JsonKey(name: 'comments')
  final String? comments;
  @JsonKey(name: 'attempt_number')
  final int attemptNumber;
  @JsonKey(name: 'result')
  final bool result;
  @JsonKey(name: 'application_id')
  final int? applicationId;

  Attempt(
      {this.id,
      this.help,
      this.comments,
      required this.attemptNumber,
      required this.result,
      this.applicationId});

  factory Attempt.fromJson(Map<String, dynamic> json) =>
      _$AttemptFromJson(json);

  Map<String, dynamic> toJson() => _$AttemptToJson(this);

  @override
  String toString() {
    return 'Protocol(id: $id, help: $help, comments: $comments, attempt_number: $attemptNumber, result: $result, application_id: $applicationId )';
  }
}
