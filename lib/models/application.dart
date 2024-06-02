import 'package:aba_app/models/Protocol.dart';
import 'package:aba_app/models/attempt.dart';

class Application {
  final double positivePercentage;
  final DateTime createdAt;
  final String createdBy;
  final bool aborted;

  Application(
      {required this.positivePercentage,
      required this.createdAt,
      required this.createdBy,
      required this.aborted});
  // late int success;
  // late int failure;
  // late String reasonAbortion;
  // late List<Attempt> attempts;
  // late Protocol protocol;
}
