import 'package:aba_app/models/application.dart';
import 'package:aba_app/models/client.dart';
import 'package:faker/faker.dart';
import 'dart:math';

List<String> protocols = [
  'Sentar',
  'Olhar',
  'Responder',
  'Atender',
  'Protocol-5',
  'Protocol-6,',
  'Protocol-7',
  'Protocol-8',
  'Protocol-9',
  'Protocol-10'
];

final random = Random();

class Protocol {
  final String name;
  // late DateTime createdAt;
  // late String createdBy;
  // late Client client;
  // late List<Application> application;

  Protocol({required this.name});

  Protocol.fromFaker(Faker faker) : name = protocols[random.nextInt(10)];
}
