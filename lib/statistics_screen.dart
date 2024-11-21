import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart

class StatisticsScreen extends StatelessWidget {
  final List<FlSpot> seriesList;

  StatisticsScreen({required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estadísticas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
            ),
            borderData: FlBorderData(show: true),
            minX: 0,
            maxX: seriesList.length.toDouble() - 1,
            minY: 1,
            maxY: 5,
            lineBarsData: [
              LineChartBarData(
                spots: seriesList,
                isCurved: true,
                color: Colors.blue, // Use color directly here
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}