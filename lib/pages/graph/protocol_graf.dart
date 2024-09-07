import 'package:aba_app/data/protocol_data.dart';
import 'package:aba_app/pages/graph/protocol_line_chart.dart';
import 'package:flutter/material.dart';

class ProtocolGraf extends StatelessWidget {
  const ProtocolGraf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico do Protocolo'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 2,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const Text(
              'Gráfico',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: ProtocolLineChart(protocolData))
          ],
        ),
      ),
    );
  }
}
