import 'package:flutter/material.dart';

class ApplicationDetails extends StatelessWidget {
  const ApplicationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes das Aplicações'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
                "Tela para detalhes dos protocolos lançados, como (Quem aplicou, quando, porcentagem de acerto, teve alguma ajuda, nº de acerto e nº de erros...) informativos e relatórios"),
          )
        ],
      ),
    );
  }
}
