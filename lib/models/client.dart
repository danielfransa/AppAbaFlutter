import 'package:aba_app/core/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

String imageData = kBase64Image;

@JsonSerializable()
class Client {
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'birthday')
  final DateTime birthday;
  @JsonKey(name: 'email')
  final String email;

  Client(
      {required this.id,
      required this.name,
      required this.email,
      required this.birthday});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

// flutter pub run build_runner watch --delete-conflicting-outputs