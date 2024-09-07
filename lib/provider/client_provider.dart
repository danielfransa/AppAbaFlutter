import 'package:aba_app/models/client.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_provider.g.dart';

@riverpod
FutureOr<List<Client>> clients(ClientsRef ref) async {
  final response =
      await ref.watch(supabaseClientProvider).from('client').select('*');

  return [for (final c in response) Client.fromJson(c)];
}
