import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'dart:math' as math;

import 'package:pie_chart/pie_chart.dart';
//TODO : Make the ProjectCharts dynamics by settings parameters (datamap) and legends
enum LegendShape { Circle, Rectangle }

class ProjetCharts extends StatelessWidget{

  final legendLabels = <String, String>{
    "SOLIDAIRE": "SOLIDAIRE legend",
    "Handicape": "Handicape legend",
    "Maladie NON !": "Maladie NON ! legend",
    "Contre le COVID": "Contre le COVID legend",
  };

  final colorList = <Color>[
    Color(0xfffdcb6e),
    Color(0xff0984e3),
    Color(0xfffd79a8),
    Color(0xffe17055),
    Color(0xff6c5ce7),
  ];

  final dataMap = <String, double>{
    "SOLIDAIRE": 25,
    "Handicape": 55,
    "Maladie NON !": 151,
    "Contre le COVID": 121,
  };

  @override
  Widget build(BuildContext context){
    double? _chartLegendSpacing = 32;
    ChartType? _chartType = ChartType.disc;
    bool _showLegendLabel = false;
    bool _showLegendsInRow = false;
    LegendPosition? _legendPosition = LegendPosition.right;
    bool _showLegends = true;
    LegendShape? _legendShape = LegendShape.Circle;
    bool _showChartValueBackground = true;
    bool _showChartValues = true;
    bool _showChartValuesInPercentage = false;
    bool _showChartValuesOutside = false;
    double? _ringStrokeWidth = 32;
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing!,
      chartRadius: math.min(MediaQuery.of(context).size.width / 1.5, 300),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType!,
      //centerText: _showCenterText ? "HYBRID" : null,
      legendLabels: _showLegendLabel ? legendLabels : {},
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition!,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.Circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth!,
      emptyColor: Colors.grey,
      //gradientList: _showGradientColors ? gradientList : null,
      emptyColorGradient: [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );
    return Container(
        height: 200,
        padding: EdgeInsets.all(10),
        child: Card(
          child: Column(
            children: <Widget>[
              Text("Nombre de personne par projet",
                style: const TextStyle (
                  //Theme.of(context).textTheme.bodyText1,
                  fontSize: 20.0,
                )
              ),
              Expanded(
                  child: chart
              ),
            ],
          ),
        )
    );
  }
}