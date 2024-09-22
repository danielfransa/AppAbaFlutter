import 'package:aba_app/models/application.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_provider.g.dart';

int success = 0;
int fail = 0;

@riverpod
FutureOr<List<Application>> applications(
    ApplicationsRef ref, int protocolId) async {
  // Obtém a instância do Dio do apiProvider
  final dio = ref.watch(apiProvider);

  // Fazendo a requisição GET para a API
  final response = await dio.get('/application/protocol/$protocolId');

  // Verificando se a requisição foi bem-sucedida
  if (response.statusCode == 200) {
    final List<dynamic> responseData = response.data;

    // Convertendo os dados para a lista de Application
    final applications =
        responseData.map((c) => Application.fromJson(c)).toList();

    // Itera sobre cada application
    success = 0;
    fail = 0;
    for (var app in applications) {
      if (app.aborted == true) {
        fail += 1;
      } else {
        success += 1;
      }
    }
    // Atualiza os valores dos providers de sucesso e falha
    ref.read(successProvider.notifier).state = success;
    ref.read(failProvider.notifier).state = fail;

    return applications;
  } else {
    throw Exception('Erro ao buscar aplicações da API');
  }
}

final successProvider = StateProvider<int>((ref) => 0);
final failProvider = StateProvider<int>((ref) => 0);
