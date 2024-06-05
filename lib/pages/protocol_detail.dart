import 'package:aba_app/models/protocol.dart';
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
      appBar: AppBar(
        title: const Text('Detalhes do Protocolo'),
      ),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(8),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromRGBO(40, 130, 158, 1)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const NewApplication()),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Novo'),
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
    );
  }
}
