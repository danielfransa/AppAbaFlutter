import 'package:aba_app/widgets/list_clients.dart';
import 'package:aba_app/widgets/loading_widget.dart';
import 'package:aba_app/widgets/search_imput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aba_app/provider/client_provider.dart';

class Buscar extends ConsumerWidget {
  const Buscar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var clients = ref.watch(clientsProvider);

    return Column(
      children: [
        SearchImput(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Flexible(
              child: clients.when(
                data: (clients) {
                  return ListView.separated(
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
        const Divider(),
      ],
    );
  }
}
