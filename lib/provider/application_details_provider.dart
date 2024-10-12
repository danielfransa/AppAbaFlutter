import 'package:aba_app/models/application.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_details_provider.g.dart';

@riverpod
FutureOr<Application> application(ApplicationRef ref, int applicationId) async {
  // Obtém a instância do Dio do apiProvider
  final dio = ref.watch(apiProvider);

  // Fazendo a requisição GET para a API
  final response = await dio.get('/application/$applicationId');

  // Verificando se a requisição foi bem-sucedida
  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = response.data;

    // Convertendo os dados para a lista de Application
    final application = Application.fromJson(responseData);

    return application;
  } else {
    throw Exception('Erro ao buscar aplicações da API');
  }
}
