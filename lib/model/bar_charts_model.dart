import 'package:charts_flutter/flutter.dart' as charts;

class BarCharts {
  String? jenis;
  int? angka;
  late final charts.Color? color;

  BarCharts({
    required this.jenis,
    required this.angka,
    required this.color,
  });
}
