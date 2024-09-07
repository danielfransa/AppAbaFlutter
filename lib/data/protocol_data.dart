import 'package:collection/collection.dart';

class ProtocolData {
  final double x;
  final double y;

  ProtocolData({required this.x, required this.y});
}

List<ProtocolData> get protocolData {
  final data = <double>[80, 100, 90, 10, 40, 100, 80, 40, 20, 40, 90, 90, 100];
  return data
      .mapIndexed(((index, element) =>
          ProtocolData(x: index.toDouble() + 1, y: element)))
      .toList();
}
