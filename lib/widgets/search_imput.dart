import 'package:flutter/material.dart';

class SearchImput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final ValueChanged<String> onSearch;

  SearchImput({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          labelText: 'Pesquisar',
          suffixIcon: IconButton(
            onPressed: () {
              // Chama o callback apenas quando o ícone de pesquisa é pressionado
              onSearch(_controller.text);
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
