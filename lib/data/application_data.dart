class ApplicationData {
  final double x;
  final String y;

  ApplicationData({required this.x, required this.y});
}

List<ApplicationData> get applicationData {
  final data = <String>[
    'Falha',
    'Sucesso',
    'Sucesso',
    'Sucesso',
    'Sucesso',
    'Falha',
    'Sucesso',
    'Falha',
    'Sucesso',
    'Sucesso'
  ];
  return data.asMap().entries.map((entry) {
    return ApplicationData(x: entry.key.toDouble(), y: entry.value);
  }).toList();
}
