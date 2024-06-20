import 'package:aba_app/models/application.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_provider.g.dart';

@riverpod
FutureOr<List<Application>> applications(
    ApplicationsRef ref, int protocolId) async {
  final response = await ref
      .watch(supabaseClientProvider)
      .from('applications')
      .select('*')
      .eq("protocol_id", protocolId);

  return [for (final a in response) Application.fromJson(a)];
}

final successProvider =
    FutureProvider.family<int, int>((ref, protocolId) async {
  final response = await ref
      .watch(supabaseClientProvider)
      .from('applications')
      .select('*')
      .eq('aborted', false)
      .eq('protocol_id', protocolId);

  return response.length;
});

final failProvider = FutureProvider.family<int, int>((ref, protocolId) async {
  final response = await ref
      .watch(supabaseClientProvider)
      .from('applications')
      .select('*')
      .eq('aborted', true)
      .eq('protocol_id', protocolId);

  return response.length;
});
