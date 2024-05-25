import 'package:aba_app/pages/protocol_detail.dart';
import 'package:flutter/material.dart';

class PerfilDetails extends StatelessWidget {
  const PerfilDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes e Protocolos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ProtocolDetail()),
                  ),
                );
              },
              child: const Text('Protocol Details')),
          const Center(
            child: Text(
                "Aqui vai ter detalhes dos clientes e os Protocolos criados para o cliente ao clicar em um protocolo vamos para a tela protocol."),
          )
        ],
      ),
    );
  }
}
