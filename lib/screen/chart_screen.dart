import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData4 = List.generate(4, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData5 = List.generate(6, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData6 = List.generate(7, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  bool chartBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 300,
                  child: ChartGraph(dummyData1, dummyData2, dummyData3)),

              Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 300,
                  child: ChartGraph2(dummyData4, dummyData5, dummyData6, chartBool)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (value){
                      setState(() {
                        chartBool = value!;

                      });
                    },
                    value: chartBool,
                  ),
                  Text("바껴라!!! 얍!!!!"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ChartGraph(dummyData1, dummyData2, dummyData3) {
  return LineChart(
    LineChartData(
      borderData: FlBorderData(show: false),
      lineBarsData:  [
        // The red line
        LineChartBarData(
          spots: dummyData1,
          isCurved: true,
          barWidth: 2,
          color: Colors.indigo,
        ),
        // The orange line
        LineChartBarData(
          spots: dummyData2,
          isCurved: true,
          barWidth: 2,
          color: Colors.red,
        ),
        // The blue line
        LineChartBarData(
          spots: dummyData3,
          isCurved: false,
          barWidth: 2,
          color: Colors.blue,
        )
      ]
    ),
  );
}

Widget ChartGraph2(dummyData1, dummyData2, dummyData3, chartBool) {
  return LineChart(
    LineChartData(
        borderData: FlBorderData(show: false),
        lineBarsData: chartBool ? [
          // The red line
          LineChartBarData(
            spots: dummyData1,
            isCurved: true,
            barWidth: 2,
            color: Colors.indigo,
          ),
          // The orange line
          LineChartBarData(
            spots: dummyData2,
            isCurved: true,
            barWidth: 2,
            color: Colors.red,
          ),
          // The blue line
          LineChartBarData(
            spots: dummyData3,
            isCurved: false,
            barWidth: 2,
            color: Colors.blue,
          )
        ] : [
          // The red line
          LineChartBarData(
            spots: dummyData1,
            isCurved: true,
            barWidth: 2,
            color: Colors.indigo,
          ),
          // The orange line
          LineChartBarData(
            spots: dummyData2,
            isCurved: true,
            barWidth: 2,
            color: Colors.red,
          ),

        ]
    ),
  );
}


