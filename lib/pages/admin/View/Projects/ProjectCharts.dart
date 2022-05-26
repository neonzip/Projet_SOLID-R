import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'dart:math' as math;

import 'package:pie_chart/pie_chart.dart';
//TODO : Make the ProjectCharts dynamics by settings parameters (datamap) and legends
enum LegendShape { circle, rectangle }

class ProjetCharts extends StatelessWidget{

  final legendLabels = <String, String>{
    "SOLIDAIRE": "SOLIDAIRE legend",
    "Handicape": "Handicape legend",
    "Maladie NON !": "Maladie NON ! legend",
    "Contre le COVID": "Contre le COVID legend",
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  final dataMap = <String, double>{
    "SOLIDAIRE": 25,
    "Handicape": 55,
    "Maladie NON !": 151,
    "Contre le COVID": 121,
  };

  ProjetCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    /// Space between each legend
    double? _chartLegendSpacing = 32;

    /// Form of chart
    ChartType? _chartType = ChartType.disc;

    bool _showLegendLabel = false;

    /// Disposition of the legends.
    /// True : in row
    /// False : in column
    bool _showLegendsInRow = false;

    /// Position of the legend depending of the chart
    LegendPosition? _legendPosition = LegendPosition.right;

    /// Shows or not the legends
    bool _showLegends = true;

    /// Shape of the legends colors
    LegendShape? _legendShape = LegendShape.circle;

    /// Shows a white background of the values in the chart if it is true
    bool _showChartValueBackground = false;


    /// Shows the values in the chart if it is true
    bool _showChartValues = true;

    /// Shows the values in percentage if it is true
    bool _showChartValuesInPercentage = true;

    /// Shows the values outside of the chart if it is true
    bool _showChartValuesOutside = false;


    /// ?
    double? _ringStrokeWidth = 64;


    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing,
      chartRadius: math.min(MediaQuery.of(context).size.width / 1.5, 300),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType,
      //centerText: _showCenterText ? "HYBRID" : null,
      legendLabels: _showLegendLabel ? legendLabels : {},
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth,
      emptyColor: Colors.grey,
      //gradientList: _showGradientColors ? gradientList : null,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );
    return Container(
        height: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10), //border corner radius
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            children: <Widget>[
              const Text("Nombre de personne par projet",
                textAlign: TextAlign.center,
                style: TextStyle (
                  fontSize: 18.0,
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