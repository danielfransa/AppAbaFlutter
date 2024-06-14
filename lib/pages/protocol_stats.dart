import 'dart:convert';

import 'package:aba_app/core/constants.dart';
import 'package:aba_app/models/client.dart';
import 'package:aba_app/pages/protocol_graf.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProtocolStats extends StatefulWidget {
  const ProtocolStats({super.key});

  @override
  State<ProtocolStats> createState() => _ProtocolStatsState();
}

class _ProtocolStatsState extends State<ProtocolStats> {
  final client = Client.fake();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Protocolo'),
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
            Text(
              client.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
              child: Text(
                client.email,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                Column(
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
                Column(
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
