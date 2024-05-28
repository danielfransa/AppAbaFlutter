import 'package:aba_app/pages/client_detail.dart';
import 'package:flutter/material.dart';

class Buscar extends StatelessWidget {
  const Buscar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const ClientDetail()),
                ),
              );
            },
            child: const Text('Client Detail')),
        const Center(
          child: Text(
              "Um botão de procurar que apos a busca dever trazer uma lista e ao clicar leva para a mesma pagina de perfil_detail que a tela perfil mostra."),
        )
      ],
    );
  }
}
