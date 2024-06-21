import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class NewApplication extends StatefulWidget {
  const NewApplication({super.key});
  static List<String> status = ['Sucesso', 'Falha'];

  @override
  State<NewApplication> createState() => _NewApplicationState();
}

class _NewApplicationState extends State<NewApplication> {
  final DateFormat dateFormat = DateFormat('dd/MM/yy - HH:mm');

  final random = Random().nextInt(10);

  String? _statusSelecionado = NewApplication.status.first;

  final _tipController = TextEditingController();

  void _onTip() {
    final tipData = _tipController.text;
    // Realize a pesquisa com o termo digitado
    print('A Dica foi: $tipData');
  }

  final _ObservationController = TextEditingController();

  void _onObservtion() {
    final observationData = _ObservationController.text;
    // Realize a pesquisa com o termo digitado
    print('A Observação foi: $observationData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Protocolo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 28.0, 8.0, 8.0),
                child: Text(
                  "Aplicação - ${dateFormat.format(DateTime.now())}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 28.0, 8.0),
                  child: Text(
                    "Tentativa - $random de 10",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: NewApplication.status
                  .map((p) => Expanded(
                        child: ListTile(
                          leading: Radio<String>(
                            value: p,
                            groupValue: _statusSelecionado,
                            onChanged: (value) {
                              setState(() {
                                _statusSelecionado = value;
                              });
                            },
                          ),
                          title: Text(
                            p,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: TextField(
                controller: _tipController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelText: 'Foi dada alguma ajuda',
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: TextField(
                controller: _ObservationController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelText: 'Observação',
                ),
              ),
            ),
            const SizedBox(height: 60),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(400, 75),
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
              child: const Text(
                'Abortar',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 75),
                foregroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
              child: const Text(
                'Completo',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
