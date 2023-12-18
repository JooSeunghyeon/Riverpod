import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';

class ChartModel{

  final List<FlSpot> spots;

  final bool isCurved;

  final int barWidth;

  final Color color;

  ChartModel({
    required this.spots,
    required this.isCurved,
    required this.barWidth,
    required this.color
});

}