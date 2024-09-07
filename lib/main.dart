import 'package:aba_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.get('SB_URL'),
    anonKey: dotenv.get('SB_ANON_KEY'),
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}
