import 'package:aba_app/core/constants.dart';
import 'package:faker/faker.dart';

class Client {
  final String name;
  // late DateTime birthday;
  // late Gender gender;
  final String email;
  // late String cpf;
  // late String telephone;
  // late String educationLevel;
  // late String medicalInformations;
  // late String medicinesInUse;
  // late String processingInformation;
  // late String createdBy;
  // late DateTime createdAt;
  // late List<Responsible> respponsible;
  final String? imageData;

  Client({
    required this.name,
    required this.email,
    this.imageData,
  });

  factory Client.fake() {
    return Client(
      name: faker.person.name(),
      email: faker.internet.email(),
      imageData: kBase64Image,
    );
  }
}

// Address address, vai precisar?
