import 'package:aba_app/models/client.dart';
import 'package:aba_app/models/protocol.dart';
import 'package:aba_app/pages/graph/application_graf.dart';
import 'package:aba_app/pages/new_application.dart';
import 'package:aba_app/provider/application_provider.dart';
import 'package:aba_app/widgets/list_application.dart';
import 'package:aba_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProtocolDetail extends ConsumerWidget {
  const ProtocolDetail(
      {super.key, required this.protocol, required this.client});

  final Protocol protocol;
  final Client client;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var applications = ref.watch(applicationsProvider(protocol.id));
    var success = ref.watch(successProvider);
    var fail = ref.watch(failProvider);

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
                    protocol.name!,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 8,
                  child: Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            success.toString(), //totals
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Completados',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Define a borda arredondada
                  ),
                  elevation: 8, // Sombra do card
                  child: Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.red, // Cor de fundo vermelha
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            fail.toString(), //abortados
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Abortados',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: applications.when(
                  data: (applications) {
                    return ListView.builder(
                      itemCount: applications.length,
                      itemBuilder: (context, index) {
                        final application = applications[index];
                        return ListApplication(application: application);
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => NewApplication(
                    protocol: protocol,
                  )),
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
