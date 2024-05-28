import 'package:aba_app/pages/application_details.dart';
import 'package:aba_app/pages/new_application.dart';
import 'package:flutter/material.dart';

class ProtocolDetail extends StatelessWidget {
  const ProtocolDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Protocolos e Aplicar um Novo Protocolo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const NewApplication()),
                  ),
                );
              },
              child: const Text('New_Application')),
          const Center(
            child: Text(
                "Aqui vai ter detalhes dos protocolos ou seja as aplicações desse protocolo ao clicar em um protocolo podemos ver os detalhes deles (application_datails) ou ao clicar em nova aplicação podemos gerar uma nova aplicação (new_application)."),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ApplicationDetails()),
                  ),
                );
              },
              child: const Text('Application_details')),
        ],
      ),
    );
  }
}
