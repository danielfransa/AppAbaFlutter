import 'dart:math';

import 'package:aba_app/models/phrases_models.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phrases_provider.g.dart';

@Riverpod(keepAlive: true)
class Phrases extends _$Phrases {
  @override
  List<PhrasesModel> build() {
    return [];
  }

  List<dynamic>? quotesJson;

  void add() async {
    if (quotesJson == null) {
      var response = await ref.read(dioProvider).get('');
      if (response.statusCode != 200) {
        return;
      }
      quotesJson = response.data;
    }

    var quote = PhrasesModel.fromMap(quotesJson?[Random().nextInt(289)]);
    if (!state.contains(quote)) {
      state = [...state, quote];
    }
  }
}
