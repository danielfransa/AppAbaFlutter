import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dio/dio.dart';

part 'app_provider.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  return Supabase.instance.client;
}

final dioProvider = Provider(
  (ref) => Dio(
    BaseOptions(baseUrl: 'https://moraislucas.github.io/MeMotive/phrases.json'),
  ),
);

final apiProvider = Provider(
  (ref) => Dio(
    BaseOptions(baseUrl: 'https://fatec-aba-project-backend.onrender.com'),
  ),
);


// OBS: lembrar que dependendo do emulador muda essa ip  do apiProvider nesse caso meu computador na rede era esse ip usando celular fisico como emulador