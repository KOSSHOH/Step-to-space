import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DeleteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DeleteScreenState();
  }
}

class _DeleteScreenState extends State<DeleteScreen> {
  final data = [
    new SalesData(1, 230),
    new SalesData(2, 230),
    new SalesData(3, 230),
    new SalesData(4, 225),
    new SalesData(5, 220),
    new SalesData(6, 218),
    new SalesData(7, 215),
    new SalesData(8, 210),
    new SalesData(9, 205),
    new SalesData(10, 200),
    new SalesData(11, 195),
    new SalesData(12, 190),
    new SalesData(13, 185),
    new SalesData(14, 180),
    new SalesData(15, 175),
    new SalesData(16, 175),
    new SalesData(17, 180),
    new SalesData(18, 185),
    new SalesData(19, 185),
    new SalesData(20, 185),
    new SalesData(21, 185),
    new SalesData(22, 190),
    new SalesData(23, 190),
    new SalesData(24, 190),
    new SalesData(25, 190),
    new SalesData(26, 195),
    new SalesData(27, 195),
    new SalesData(28, 195),
    new SalesData(29, 195),
    new SalesData(30, 200),
  ];

  _getSeriesData() {
    List<charts.Series<SalesData, int>> series = [
      charts.Series(
        id: "Sales",
        data: data,
        domainFn: (SalesData series, _) => series.year,
        measureFn: (SalesData series, _) => series.sales,
        colorFn: (SalesData series, _) =>
            charts.MaterialPalette.blue.shadeDefault,
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Container(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Population of U.S. over the years",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: new charts.LineChart(
                  _getSeriesData(),
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final int year;
  final int sales;

  SalesData(this.year, this.sales);
}
