import 'dart:math';
import 'package:intl/intl.dart';
import 'package:aba_app/models/application.dart';
import 'package:aba_app/pages/application_details.dart';
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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8.0,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => ApplicationDetails()),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: circleColor,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        title: Text(
          'Aplicação - ${dateFormat.format(application.createdAt)}  - Acerto:  ${application.positivePercentage.toStringAsFixed(2)}%',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Aplicado por: ${application.createdBy}'),
        trailing:
            Text('Status: ${application.aborted ? 'Abortado' : 'Completado'}'),
      ),
    );
  });
}
