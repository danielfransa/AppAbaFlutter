import 'package:aba_app/widgets/list_cards.dart';
import 'package:aba_app/widgets/search_imput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Buscar extends StatelessWidget {
  const Buscar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchImput(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(children: createList(context)),
          ),
        ),
      ],
    );
  }
}
