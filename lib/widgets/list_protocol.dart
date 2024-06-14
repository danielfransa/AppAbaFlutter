import 'package:aba_app/models/protocol.dart';
import 'package:aba_app/pages/protocol_detail.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

List<Widget> createProtocolList(BuildContext context) {
  // Gerar lista de Widgets com 20 elementos
  return List.generate(3, (index) {
    // Gerar um objeto da nossa model class a partir do Faker()
    final protocol = Protocol.fromFaker(faker);

    // Gerar Card com os dados a partir do objeto feed
    return Card(
      child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => ProtocolDetail(
                      protocol: protocol,
                      Protocol: protocol,
                    )),
              ),
            );
          },
          title: Text(protocol.name)),
    );
  });
}
