import 'dart:convert';

import 'package:aba_app/core/constants.dart';
import 'package:aba_app/core/utils.dart';
import 'package:aba_app/models/client.dart';
import 'package:aba_app/models/protocol.dart';
import 'package:aba_app/provider/protocol_provider.dart';
import 'package:aba_app/widgets/list_protocol.dart';
import 'package:aba_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientDetail extends ConsumerWidget {
  const ClientDetail({super.key, required this.client});
  final Client client;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var protocols = ref.watch(protocolsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.memory(
                    base64Decode(kBase64Image),
                    height: 190,
                    width: 190,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Text(
              client.name,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Idade ${calculateAge(client.birthday)} anos',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Protocolos',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Flexible(
                  child: protocols.when(
                    data: (data) {
                      List<Protocol> protocols = data.where((protocol) {
                        return protocol.clientId == client.id;
                      }).toList();
                      return ListView.builder(
                        itemCount: protocols.length,
                        itemBuilder: (context, index) {
                          final protocol = protocols[index];
                          return ListProtocols(protocol: protocol);
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(
                        child: Text(error.toString()),
                      );
                    },
                    loading: () => const LoadingWidget(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// // Filtre a lista de protocolos com clients_id = 1
//     List<Protocol> filteredProtocols = protocols.where((protocol) {
//       return protocol.clientsId == 1;
//     }).toList();

// flutter pub run build_runner watch --delete-conflicting-outputs