import 'package:aba_app/models/attempt.dart';
import 'package:aba_app/provider/application_details_provider.dart';
import 'package:aba_app/widgets/loading_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ApplicationDetail extends ConsumerWidget {
  const ApplicationDetail({super.key, required this.applicationId});

  final int applicationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicationData = ref.watch(applicationProvider(applicationId));
    final DateFormat dateFormat = DateFormat('dd/MM/yy - HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Aplicação'),
      ),
      body: applicationData.when(
        data: (application) {
          // Renderize os detalhes da aplicação aqui
          var hits = application.attempts.where((e) => e.result == true).length;
          var dismiss = application.attempts.length - hits;
          var aborted = application.aborted! ? (10 - (hits + dismiss)) : 0;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Gráfico sucesso e falhas:
              Card(
                elevation: 4,
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: PieChart(
                    PieChartData(
                      borderData: FlBorderData(show: true),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: hits.toDouble(),
                          title: hits.toString(),
                          borderSide: const BorderSide(
                            width: 4,
                            style: BorderStyle.solid,
                            color: Colors.white,
                          ),
                          titleStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withAlpha(125),
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                        ),
                        PieChartSectionData(
                          color: Colors.red,
                          value: dismiss.toDouble(),
                          title: dismiss.toString(),
                          borderSide: const BorderSide(
                            width: 4,
                            style: BorderStyle.solid,
                            color: Colors.white,
                          ),
                          titleStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withAlpha(125),
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                        ),
                        if (aborted > 0)
                          PieChartSectionData(
                              color: Colors.grey, value: aborted.toDouble()),
                      ],
                    ),
                  ),
                ),
              ),

              // Detalhes da aplicação
              Card(
                elevation: 4,
                child: SizedBox(
                  height: application.aborted == true ? 250 : 160,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'Informações gerais sobre a aplicação:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 27),
                          Row(
                            children: [
                              const Text(
                                'Porcentagem Positiva:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '  ${application.positivePercentage}%',
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'Criado por:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '  ${application.createdBy}',
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'Criado em:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '  ${dateFormat.format(application.createdAt)}',
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          if (application.aborted == true)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Motivo do Aborto: ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Text(
                                    '  ${application.reasonAbortion}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: application.attempts.length,
                  itemBuilder: (context, index) {
                    Attempt attempt = application.attempts[index];
                    final circleColor = attempt.result == false
                        ? const Color.fromRGBO(255, 0, 0, 0.2)
                        : const Color.fromRGBO(0, 255, 0, 0.2);
                    final iconColor = attempt.result == false
                        ? Colors.redAccent
                        : Colors.greenAccent;
                    final icon =
                        attempt.result == false ? Icons.clear : Icons.done;
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: circleColor,
                                child: Icon(
                                  icon,
                                  color: iconColor,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tentativa ${attempt.attemptNumber}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                        'Resultado: ${attempt.result == false ? 'Falha' : 'Sucesso'}'),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ajuda: ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '  ${attempt.help}',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Comentário: ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '  ${attempt.comments}',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text('Erro: $error'));
        },
        loading: () => const LoadingWidget(),
      ),
    );
  }
}

// return Scaffold(
//   appBar: AppBar(
//     title: const Text('Detalhes da Aplicação - aqui'),
//   ),
//   body: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ClipOval(
//               child: Image.memory(
//                 base64Decode(kBase64Image),
//                 height: 130,
//                 width: 130,
//                 fit: BoxFit.cover,
//               ),
//             )
//           ],
//         ),
//         Text(
//           application.id.toString(),
//           style: const TextStyle(
//             fontSize: 26,
//             fontWeight: FontWeight.w700,
//             color: Colors.black,
//           ),
//         ),
//         const Padding(
//           padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
//           child: Text(
//             'client.email',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: Colors.grey,
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Column(
//                 children: [
//                   Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     elevation: 8,
//                     child: Container(
//                       width: 120,
//                       height: 110,
//                       decoration: BoxDecoration(
//                         color: const Color.fromRGBO(40, 130, 158, 1),
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: const Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               '999',
//                               style: TextStyle(
//                                 fontSize: 64,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'Consultas',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 children: [
//                   Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           20.0), // Define a borda arredondada
//                     ),
//                     elevation: 8, // Sombra do card
//                     child: Container(
//                       width: 120,
//                       height: 110,
//                       decoration: BoxDecoration(
//                         color: Colors.blue, // Cor de fundo vermelha
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: const Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               '999',
//                               style: TextStyle(
//                                 fontSize: 64,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'Concluidas',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 children: [
//                   Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           20.0), // Define a borda arredondada
//                     ),
//                     elevation: 8, // Sombra do card
//                     child: Container(
//                       width: 120,
//                       height: 110,
//                       decoration: BoxDecoration(
//                         color: Colors.red, // Cor de fundo vermelha
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: const Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               '999',
//                               style: TextStyle(
//                                 fontSize: 64,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'Abortados',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//         const Padding(
//           padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Estatisticas',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
//             ),
//           ),
//         ),
//         Expanded(
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ProtocolGraf(),
//                 ),
//               );
//             },
//             child: Image.asset(
//               'assets/images/graficos.png',
//             ),
//           ),
//         )
//       ],
//     ),
//   ),
// );
