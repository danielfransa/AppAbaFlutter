import 'package:aba_app/provider/application_details_provider.dart';
import 'package:aba_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/application_detail_widget.dart';

class ApplicationDetail extends ConsumerWidget {
  const ApplicationDetail({super.key, required this.applicationId});

  final int applicationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicationData = ref.watch(applicationProvider(applicationId));

    return Scaffold(
      body: applicationData.when(
        data: (application) =>
            ApplicationDetailBodyWidget(application: application),
        error: (error, stackTrace) => Center(child: Text('Erro: $error')),
        loading: () => const LoadingWidget(),
      ),
    );
  }
}
