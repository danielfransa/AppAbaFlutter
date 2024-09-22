import 'package:aba_app/models/create_application.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_application_provider.g.dart';

@riverpod
class AddApplication extends _$AddApplication {
  @override
  List<CreateApplication> build() {
    return [];
  }

  Future<void> addApplication(Map<String, dynamic> paramsJson) async {
    var dio = ref.read(apiProvider);

    try {
      var response = await dio.post('/application', data: paramsJson);

      if (response.statusCode != 200) {
        return;
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
