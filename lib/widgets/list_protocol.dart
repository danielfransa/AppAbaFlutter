import 'package:aba_app/models/protocol.dart';
import 'package:aba_app/pages/protocol_detail.dart';
import 'package:flutter/material.dart';

class ListProtocols extends StatelessWidget {
  const ListProtocols({super.key, required this.protocol});

  final Protocol protocol;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => ProtocolDetail(
                    protocol: protocol,
                  )),
            ),
          );
        },
        title: Text(protocol.name!.toString()),
        subtitle: Text("Criado por: ${protocol.createdBy.toString()}"),
      ),
    );
  }
}
