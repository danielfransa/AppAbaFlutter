import 'package:aba_app/models/protocol.dart';
import 'package:aba_app/pages/application_graf.dart';
import 'package:aba_app/pages/new_application.dart';
import 'package:aba_app/widgets/list_application.dart';
import 'package:flutter/material.dart';

class ProtocolDetail extends StatelessWidget {
  const ProtocolDetail(
      {super.key, required this.protocol, required Protocol Protocol});

  final Protocol protocol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Protocolo'), actions: [
        IconButton(
          icon: const Icon(Icons.stacked_line_chart_sharp),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const ApplicationGraf()),
              ),
            );
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    protocol.name,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView(children: createApplicationList(context)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const NewApplication()),
            ),
          );
        },
        backgroundColor: const Color.fromRGBO(40, 130, 158, 1),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        isExtended: true,
        elevation: 8,
        label: const Row(
          children: [Icon(Icons.add_sharp), Text('Novo')],
        ),
      ),
    );
  }
}
