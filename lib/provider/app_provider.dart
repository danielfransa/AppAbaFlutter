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

final createApplicationProvider = Provider(
  (ref) => Dio(
    BaseOptions(baseUrl: 'http://54.145.194.199:8080'),
  ),
);
