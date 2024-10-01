import 'package:json_annotation/json_annotation.dart';

part 'attempt.g.dart';

@JsonSerializable()
class Attempt {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'attemptNumber')
  final int attemptNumber;
  @JsonKey(name: 'help')
  final String? help;
  @JsonKey(name: 'comments')
  final String? comments;
  @JsonKey(name: 'result')
  final bool result;

  Attempt({
    this.id,
    required this.attemptNumber,
    this.help,
    this.comments,
    required this.result,
  });

  factory Attempt.fromJson(Map<String, dynamic> json) =>
      _$AttemptFromJson(json);

  Map<String, dynamic> toJson() => _$AttemptToJson(this);
}
