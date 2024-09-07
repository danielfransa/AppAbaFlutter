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
  @JsonKey(name: 'imageData')
  final String? imageData;

  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.birthday,
    this.imageData,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);

  @override
  String toString() {
    return 'Client(id: $id, name: $name, email: $email, birthday: $birthday, imageData: $imageData)';
  }
}

// flutter pub run build_runner watch --delete-conflicting-outputs