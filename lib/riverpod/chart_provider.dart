import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../charttest/chartdata.dart';
import '../model/chartmodel.dart';

final chartListProvider =
StateNotifierProvider<ChartListNotifier, List<ChartModel>>(
        (ref) => ChartListNotifier());

class ChartListNotifier extends StateNotifier<List<ChartModel>> {
  ChartListNotifier()
      : super(
    [
      ChartModel(
        spots: ChartData().dummyData1,
        isCurved: true,
        barWidth: 3,
        color: Colors.indigo,
      ),

      ChartModel(
        spots: ChartData().dummyData2,
        isCurved: true,
        barWidth: 3,
        color: Colors.red,
      ),

      ChartModel(
        spots: ChartData().dummyData3,
        isCurved: true,
        barWidth: 3,
        color: Colors.red,
      ),

    ],
  );
}