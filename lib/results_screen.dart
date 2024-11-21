import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'statistics_screen.dart'; // Import the statistics screen if needed
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<Map<String, dynamic>> surveys = [];
  final Map<String, IconData> serviceIcons = {
    'Industrial': Icons.build,
    'Comercial': Icons.store,
    'Residencial': Icons.home,
  };

  @override
  void initState() {
    super.initState();
    loadSurveys();
  }

  Future<void> loadSurveys() async {
    final data = await DatabaseHelper.instance.getSurveys();
    setState(() {
      surveys = data;
    });
  }

  String getRatingDescription(int rating) {
    switch (rating) {
      case 1: return 'Muy malo';
      case 2: return 'Malo';
      case 3: return 'Regular';
      case 4: return 'Bueno';
      case 5: return 'Excelente';
      default: return 'Sin calificación';
    }
  }

  String getRecommendationDescription(bool recommended) {
    return recommended ? 'Sí' : 'No';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultados')),
      body: Container(
        color: Colors.blue[50], // Set your desired background color here
        child: surveys.isEmpty
            ? Center(child: Text('No hay encuestas registradas.', style: TextStyle(fontSize: 18)))
            : ListView.separated(
          itemCount: surveys.length,
          separatorBuilder: (context, index) => Divider(height: 20),
          itemBuilder: (context, index) {
            final survey = surveys[index];
            final serviceType = survey['serviceType'];
            final iconData = serviceIcons[serviceType] ?? Icons.help;

            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(iconData, size: 40, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Servicio: $serviceType',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Calificación del servicio: ${getRatingDescription(survey['question1'])}', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text('¿Recomendaría el servicio?: ${getRecommendationDescription(survey['question2'] == 'Sí')}', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Calculate average ratings for each service type
          Map<String, List<int>> ratingsMap = {};
          for (var survey in surveys) {
            String serviceType = survey['serviceType'];
            int rating = survey['question1'];
            if (!ratingsMap.containsKey(serviceType)) {
              ratingsMap[serviceType] = [];
            }
            ratingsMap[serviceType]!.add(rating);
          }

          // Prepare data for statistics
          List<FlSpot> seriesList = [];
          int index = 0;
          ratingsMap.forEach((serviceType, ratings) {
            double averageRating = ratings.reduce((a, b) => a + b) / ratings.length;
            seriesList.add(FlSpot(index.toDouble(), averageRating)); // x: index, y: average rating
            index++;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StatisticsScreen(seriesList: seriesList),
            ),
          );
        },
        child: Icon(Icons.bar_chart),
        tooltip: 'Ver Estadísticas',
      ),
    );
  }
}
