import 'package:aba_app/models/client.dart';
import 'package:aba_app/pages/client_detail.dart';
import 'package:flutter/material.dart';

class Agenda extends StatelessWidget {
  Agenda({super.key});

  final client = Client.fake();

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
                  builder: ((context) => ClientDetail(
                        client: client,
                      )),
                ),
              );
            },
            child: const Text('Client Detail')),
        const Center(
          child: Text(
              "A ideia é que nessa tela deverá aparecer uma lista com os pacientes agendados para o dia conforme o atendente logado nosso sistema não tem uma agenda e hoje eles utilizam a agenda do google para fazer esse agendamento, podemos fazer um link com o google ou criar uma agenda no sistema (a definir)."),
        )
      ],
    );
  }
}
