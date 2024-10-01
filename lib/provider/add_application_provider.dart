import 'package:aba_app/models/application.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:aba_app/provider/application_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_application_provider.g.dart';

@riverpod
class AddApplication extends _$AddApplication {
  @override
  List<Application> build() {
    return [];
  }

  Future<void> addApplication(
      Map<String, dynamic> paramsJson, int protocolId) async {
    var dio = ref.read(apiProvider);

    try {
      var response = await dio.post('/application', data: paramsJson);

      if (response.statusCode != 200) {
        ref.invalidate(applicationsProvider(
            protocolId)); // <-- invalida e recarrega o provider
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
