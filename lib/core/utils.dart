import 'package:aba_app/models/create_application.dart';
import 'package:aba_app/models/create_attempt.dart';
import 'package:aba_app/provider/app_provider.dart';
import 'package:aba_app/provider/add_application_provider.dart';

int calculateAge(DateTime birthDate) {
  DateTime today = DateTime.now();
  int age = today.year - birthDate.year;
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }
  return age;
}

void createApplication(
    {required int paramProtocolId,
    String? paramReasonAbortion,
    required List<CreateAttempt> paramAttempts}) {
  List<CreateAttempt> attempts = paramAttempts;
  int success = 0;
  int failure = 0;
  double positivePercentage = 0.0;
  bool aborted = false;
  CreateApplication application;

  //Calcula Success e Failure
  for (var element in attempts) {
    if (element.result == true) {
      success++;
    } else {
      failure++;
    }
  }

  //Calcula Positive Percentagem
  positivePercentage = ((success * 100) / 10);

  //Verifica se houve aborto.
  if (attempts.length < 10) {
    aborted = true;
  }

  application = CreateApplication(
      protocolId: paramProtocolId,
      positivePercentage: positivePercentage,
      success: success,
      failure: failure,
      createdBy: "MobileApp",
      aborted: aborted,
      reasonAbortion: paramReasonAbortion,
      attempts: attempts);

  application.toJson();
}
