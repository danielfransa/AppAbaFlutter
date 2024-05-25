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
                "Tela para detalhes dos protocolos lançados, informativos e relatórios"),
          )
        ],
      ),
    );
  }
}
