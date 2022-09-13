import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChart extends StatelessWidget {
  const LineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<charts.Series> seriesList = _createSampleData();

    return charts.LineChart(seriesList);
  }

  static List<charts.Series> _createSampleData() {
    final data = [
      LinearSales(0, 5),
      LinearSales(1, 25),
      LinearSales(2, 100),
      LinearSales(3, 75),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
