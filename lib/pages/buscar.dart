import 'package:aba_app/models/client.dart';
import 'package:aba_app/widgets/list_clients.dart';
import 'package:aba_app/widgets/search_imput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Buscar extends StatelessWidget {
  const Buscar({super.key, required this.clients});

  final List<Client> clients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchImput(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                return ListClients(
                  client: client,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                indent: 16,
                endIndent: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
