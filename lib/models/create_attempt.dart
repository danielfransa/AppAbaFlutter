import 'package:json_annotation/json_annotation.dart';

part 'create_attempt.g.dart';

@JsonSerializable()
class CreateAttempt {
  @JsonKey(name: 'help')
  final String? help;
  @JsonKey(name: 'comments')
  final String? comments;
  @JsonKey(name: 'attemptNumber')
  final int attemptNumber;
  @JsonKey(name: 'result')
  final bool result;

  CreateAttempt(
      {this.help,
      this.comments,
      required this.attemptNumber,
      required this.result});

  factory CreateAttempt.fromJson(Map<String, dynamic> json) =>
      _$CreateAttemptFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAttemptToJson(this);

  @override
  String toString() {
    return 'Protocol(help: $help, comments: $comments, attemptNumber: $attemptNumber, result: $result )';
  }
}
