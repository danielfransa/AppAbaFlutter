import 'package:aba_app/models/client.dart';
import 'package:aba_app/pages/client_detail.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

List<Widget> createList(BuildContext context) {
  // Gerar lista de Widgets com 20 elementos
  return List.generate(10, (index) {
    // Gerar um objeto da nossa model class a partir do Faker()
    final client = Client.fromFaker(faker);

    // Gerar Card com os dados a partir do objeto feed
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const ClientDetail()),
            ),
          );
        },
        leading: Image.network(client.imageUrl),
        title: Text(
          client.name,
        ),
        subtitle: Text(client.email),
      ),
    );
  });
}
