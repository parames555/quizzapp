import 'package:flutter/material.dart';
import 'package:quizapp/controllers/dashboard_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chartwidget extends StatelessWidget {
  const Chartwidget({
    super.key,
    required this.dashCnt,
  });

  final DashboardController dashCnt;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        tooltipBehavior: dashCnt.tooltip,
        series: <CircularSeries<ChartData, String>>[
          DoughnutSeries<ChartData, String>(
              dataSource: dashCnt.data,
              // ignore: prefer_const_constructors
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                textStyle: TextStyle(fontSize: 12, color: Colors.black),
                labelAlignment: ChartDataLabelAlignment.bottom,
                connectorLineSettings: ConnectorLineSettings(
                  type: ConnectorType.curve,
                  length: '10%',
                ),
              ),
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              name: 'Quizz')
        ]);
  }
}
