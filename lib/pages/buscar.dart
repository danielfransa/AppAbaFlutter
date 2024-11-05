import 'package:aba_app/widgets/list_clients.dart';
import 'package:aba_app/widgets/loading_widget.dart';
import 'package:aba_app/widgets/search_imput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aba_app/provider/client_provider.dart';

class Buscar extends ConsumerStatefulWidget {
  const Buscar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends ConsumerState<Buscar> {
  String _searchTerm = ''; // Armazena o termo de busca

  @override
  Widget build(BuildContext context) {
    var clients = ref.watch(clientsProvider);

    return Column(
      children: [
        SearchImput(
          onSearch: (value) {
            setState(() {
              _searchTerm = value.toLowerCase(); // Atualiza o termo de busca
            });
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: clients.when(
              data: (clients) {
                // Filtra os clientes de acordo com o termo de busca
                final filteredClients = clients.where((client) {
                  final clientName = client.name
                      .toLowerCase(); // Atribua aqui o campo correto de nome
                  return clientName.contains(_searchTerm);
                }).toList();

                return ListView.separated(
                  itemCount: filteredClients.length,
                  itemBuilder: (context, index) {
                    final client = filteredClients[index];
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
        const Divider(),
      ],
    );
  }
}
