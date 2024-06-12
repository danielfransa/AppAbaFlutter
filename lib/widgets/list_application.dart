import 'dart:math';
import 'package:aba_app/data/application_data.dart';
import 'package:aba_app/pages/application_graf.dart';
import 'package:aba_app/pages/application_stats.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:aba_app/models/application.dart';
import 'package:aba_app/pages/protocol_stats.dart';
import 'package:flutter/material.dart';

List<Widget> createApplicationList(BuildContext context) {
  // Gerar lista de Widgets com 20 elementos
  return List.generate(10, (index) {
    var application = Application(
      positivePercentage: Random().nextDouble() * 100,
      createdAt: DateTime.now().subtract(Duration(days: index)),
      createdBy: 'User $index',
      aborted: Random().nextBool(),
    );

    final DateFormat dateFormat = DateFormat('dd/MM/yy HH:mm');
    final circleColor = application.aborted
        ? const Color.fromRGBO(255, 0, 0, 0.2)
        : const Color.fromRGBO(0, 255, 0, 0.2);
    final iconColor =
        application.aborted ? Colors.redAccent : Colors.greenAccent;
    final icon = application.aborted ? Icons.clear : Icons.done;

    // Gerar Card com os dados a partir do objeto feed
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => ApplicationStats(applicationData)),
            ),
          );
        },
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 4.0,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                  child: CircleAvatar(
                    backgroundColor: circleColor,
                    child: Icon(
                      icon,
                      color: iconColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          'Aplicação - ${dateFormat.format(application.createdAt)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                            'Acerto:  ${application.positivePercentage.toStringAsFixed(2)}%'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text('Aplicado por: ${application.createdBy}'),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  });
}
