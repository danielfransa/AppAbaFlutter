import 'dart:convert';

import 'package:aba_app/core/constants.dart';
import 'package:aba_app/pages/graph/protocol_graf.dart';
import 'package:flutter/material.dart';

class ApplicationDetail extends StatelessWidget {
  const ApplicationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Aplicação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.memory(
                    base64Decode(kBase64Image),
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            const Text(
              'client.name',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
              child: Text(
                'client.email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 8,
                        child: Container(
                          width: 120,
                          height: 110,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(40, 130, 158, 1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '999',
                                  style: TextStyle(
                                    fontSize: 64,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Consultas',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Define a borda arredondada
                        ),
                        elevation: 8, // Sombra do card
                        child: Container(
                          width: 120,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.blue, // Cor de fundo vermelha
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '999',
                                  style: TextStyle(
                                    fontSize: 64,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Concluidas',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Define a borda arredondada
                        ),
                        elevation: 8, // Sombra do card
                        child: Container(
                          width: 120,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.red, // Cor de fundo vermelha
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '999',
                                  style: TextStyle(
                                    fontSize: 64,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Abortados',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Estatisticas',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProtocolGraf(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/graficos.png',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
