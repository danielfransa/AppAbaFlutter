import 'package:aba_app/pages/perfil_detail.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

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
                  builder: ((context) => const PerfilDetails()),
                ),
              );
            },
            child: const Text('Perfil Detail')),
        const Center(
          child: Text(
              "Aqui deve aparecer uma lista com todos os Pacientes cadastrados ao clicar no paciente deve ir para a tela de que esta descrita como Client Before no figma, porem vai aparecer os protocolos e não as aplicações"),
        )
      ],
    );
  }
}
