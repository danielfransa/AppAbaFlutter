import 'package:aba_app/models/protocol.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'protocol_provider.g.dart';

@riverpod
FutureOr<List<Protocol>> protocols(ProtocolsRef ref) async {
  final response =
      await ref.watch(supabaseClientProvider).from('protocol').select('*');

  return [for (final p in response) Protocol.fromJson(p)];
}
