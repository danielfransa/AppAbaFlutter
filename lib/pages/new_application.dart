import 'package:flutter/material.dart';

class NewApplication extends StatelessWidget {
  const NewApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Protocolo'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
                "Tela para lançamento dos protocolos (isso pode ser um modal)"),
          )
        ],
      ),
    );
  }
}
