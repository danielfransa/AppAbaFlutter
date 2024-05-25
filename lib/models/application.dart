import 'package:aba_app/models/Protocol.dart';
import 'package:aba_app/models/attempt.dart';

class Application {
  late double positivePercentage;
  late int success;
  late int failure;
  late String createdBy;
  late bool aborted;
  late String reasonAbortion;
  late List<Attempt> attempts;
  late Protocol protocol;
}
