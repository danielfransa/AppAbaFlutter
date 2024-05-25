import 'package:flutter/material.dart';

class Agenda extends StatelessWidget {
  const Agenda({super.key});

  @override
  Widget build(BuildContext context) {
    var container = const Center(
      child: Text(
          "TODO: A ideia é que nessa tela deverá aparecer uma lista com os pacientes agendados para o dia conforme o atendente logado nosso sistema não tem uma agenda e hoje eles utilizam a agenda do google para fazer esse agendamento, podemos fazer um link com o google ou criar uma agenda no sistema (a definir)."),
    );
    return container;
  }
}
