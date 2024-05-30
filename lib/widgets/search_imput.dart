import 'package:flutter/material.dart';

class SearchImput extends StatelessWidget {
  SearchImput({super.key});

  final _controller = TextEditingController();

  void _onSearch() {
    final searchTerm = _controller.text;
    // Realize a pesquisa com o termo digitado
    print('Termo de pesquisa: $searchTerm');
  }

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
            onPressed: _onSearch,
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
