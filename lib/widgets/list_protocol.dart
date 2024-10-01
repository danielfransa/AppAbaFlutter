import 'package:aba_app/models/client.dart';
import 'package:aba_app/models/protocol.dart';
import 'package:aba_app/pages/protocol_detail.dart';
import 'package:flutter/material.dart';

class ListProtocols extends StatelessWidget {
  const ListProtocols(
      {super.key, required this.protocol, required this.client});

  final Protocol protocol;
  final Client client;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) =>
                  ProtocolDetail(protocol: protocol, client: client)),
            ),
          );
        },
        title: Text(protocol.name!.toString()),
        subtitle: Text("Criado por: ${protocol.createdBy.toString()}"),
      ),
    );
  }
}
