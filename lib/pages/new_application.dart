import 'package:aba_app/core/utils.dart';
import 'package:aba_app/models/attempt.dart';
import 'package:aba_app/models/protocol.dart';
import 'package:aba_app/provider/add_application_provider.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class NewApplication extends StatefulWidget {
  const NewApplication({super.key, required this.protocol});
  final Protocol protocol;

  static List<String> status = ['Sucesso', 'Falha'];

  @override
  State<NewApplication> createState() => _NewApplicationState();
}

class _NewApplicationState extends State<NewApplication> {
  final DateFormat dateFormat = DateFormat('dd/MM/yy');

  String? _statusSelecionado = NewApplication.status.first;

  final _tipController = TextEditingController();
  final _observationController = TextEditingController();
  final _reasonAbortion = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool abort = false;
  int tentativa = 1;
  List<Attempt> attempts = [];

  void _createAttempts(WidgetRef ref) async {
    if (abort == true) {
      Map<String, dynamic> applicationJson = createApplication(
        paramProtocolId: widget.protocol.id,
        paramReasonAbortion: _reasonAbortion.text,
        paramAttempts: attempts,
      );

      await ref
          .read(addApplicationProvider.notifier)
          .addApplication(applicationJson, widget.protocol.id);

      // voltar tentativas para primeira:
      tentativa = 1;

      // voltar aborto para false:
      abort = false;

      // lembre-se de limpar o attempts;
      attempts = [];

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
    if (tentativa == 10) {
      attempts.add(Attempt(
          attemptNumber: tentativa,
          result: _statusSelecionado == "Sucesso" ? true : false,
          help: _tipController.text,
          comments: _observationController.text));

      _statusSelecionado = NewApplication.status.first;
      _tipController.text = "";
      _observationController.text = "";

      tentativa = 1;

      Map<String, dynamic> applicationJson = createApplication(
        paramProtocolId: widget.protocol.id,
        paramReasonAbortion: "",
        paramAttempts: attempts,
      );

      await ref
          .read(addApplicationProvider.notifier)
          .addApplication(applicationJson, widget.protocol.id);

      // lembre-se de limpar o attempts;
      attempts = [];

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      attempts.add(Attempt(
          attemptNumber: tentativa,
          result: _statusSelecionado == "Sucesso" ? true : false,
          help: _tipController.text,
          comments: _observationController.text));

      _statusSelecionado = NewApplication.status.first;
      _tipController.text = "";
      _observationController.text = "";

      tentativa++;
    }
  }

  var createAt = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
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
                      "Aplicação - ${dateFormat.format(createAt)}",
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
                        "Tentativa - $tentativa de 10",
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: TextField(
                    controller: _observationController,
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
                  onPressed: () {
                    _reasonAbortion.text = '';
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirmar Aborto"),
                          content: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Digite o motivo do aborto:"),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _reasonAbortion,
                                  validator: Validatorless.required(
                                      'Motivo Obrigatório'),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    labelText: 'Motivo do Aborto',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Fecha o diálogo sem abortar
                              },
                              child: const Text("Cancelar"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context)
                                      .pop(); // Fecha o diálogo
                                  abort = true;
                                  setState(() {
                                    _createAttempts(ref);
                                  });
                                } else {
                                  print('Campo obrigatório não preenchido');
                                }
                              },
                              child: const Text("Confirmar"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 16),
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
                  onPressed: () {
                    setState(() {
                      _createAttempts(ref);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 16),
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
      },
    );
  }
}
