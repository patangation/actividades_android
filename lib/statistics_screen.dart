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
        child: Column(
          children: [
            Text('Promedio de Calificaciones por Tipo de Servicio', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: seriesList.asMap().entries.map((entry) {
                    int idx = entry.key;
                    FlSpot spot = entry.value;
                    return BarChartGroupData(x: idx, barRods: [
                      BarChartRodData(toY: spot.y, color: Colors.blue),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}