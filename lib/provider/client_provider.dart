import 'package:aba_app/models/client.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_provider.g.dart';

@riverpod
FutureOr<List<Client>> clients(ClientsRef ref) async {
  // Obtém a instância do Dio do apiProvider
  final dio = ref.watch(apiProvider);

  // Fazendo a requisição GET para a API
  final response = await dio.get('/clients');

  // Verificando se a requisição foi bem-sucedida
  if (response.statusCode == 200) {
    final List<dynamic> responseData = response.data;

    // Convertendo os dados para a lista de clientes
    final valor = responseData.map((c) => Client.fromJson(c)).toList();

    return valor;
  } else {
    throw Exception('Erro ao buscar clientes da API');
  }
}
