import 'package:aba_app/provider/protocol_provider.dart';
import 'package:aba_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProtocolList extends ConsumerWidget {
  const ProtocolList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var protocols = ref.watch(protocolsProvider);

    return Flexible(
      child: protocols.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text('data[index].name!'),
            );
          },
        ),
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}
