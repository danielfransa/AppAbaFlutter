import 'package:aba_app/pages/perfil.dart';
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
  final String imageUrl;

  Client({required this.name, required this.email, required this.imageUrl});

  Client.fromFaker(Faker faker)
      : name = faker.person.name(),
        email = faker.internet.email(),
        imageUrl = faker.image.image(
            width: 640, height: 480, keywords: const ['face'], random: true);
}

// Address address, vai precisar?
