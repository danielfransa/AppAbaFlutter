import 'package:aba_app/models/protocol.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'protocol_provider.g.dart';

@riverpod
FutureOr<List<Protocol>> protocols(ProtocolsRef ref) async {
  // Obtém a instância do Dio do apiProvider
  final dio = ref.watch(apiProvider);

  try {
    // Fazendo a requisição GET para a API
    final response = await dio.get('/protocol');

    // Verificando se a requisição foi bem-sucedida
    if (response.statusCode == 200) {
      // Garante que a resposta seja um mapa/dicionário
      if (response.data is List) {
        final List<dynamic> responseData = response.data;

        // Convertendo os dados para a lista de Protocols
        return responseData.map((item) => Protocol.fromJson(item)).toList();
      } else {
        throw Exception('Formato inesperado de resposta da API.');
      }
    } else {
      throw Exception(
          'Erro ao buscar protocolos da API: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Erro ao buscar dados da API: $e');
  }
}
