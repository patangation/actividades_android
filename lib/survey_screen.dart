import 'package:flutter/material.dart';
import 'database_helper.dart';

class SurveyScreen extends StatefulWidget {
  final String serviceType;

  SurveyScreen({required this.serviceType});

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int? question1Rating;
  bool question2Recommendation = false;

  Future<void> saveSurvey() async {
    if (question1Rating == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor responde todas las preguntas.')),
      );
      return;
    }
    final data = {
      'serviceType': widget.serviceType,
      'question1': question1Rating,
      'question2': question2Recommendation ? 'Sí' : 'No',
    };
    await DatabaseHelper.instance.insertSurvey(data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Encuesta guardada exitosamente.')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Encuesta - ${widget.serviceType}')),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.blue[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Text(
              'Por favor, califique nuestro servicio:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1. ¿Cómo califica nuestro servicio?', style: TextStyle(fontSize: 18)),
                    DropdownButton<int>(
                      value: question1Rating,
                      items: [
                        DropdownMenuItem(value: 1, child: Text('1 - Muy malo')),
                        DropdownMenuItem(value: 2, child: Text('2 - Malo')),
                        DropdownMenuItem(value: 3, child: Text('3 - Regular')),
                        DropdownMenuItem(value: 4, child: Text('4 - Bueno')),
                        DropdownMenuItem(value: 5, child: Text('5 - Excelente')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          question1Rating = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('2. ¿Recomendaría nuestro servicio?', style: TextStyle(fontSize: 18)),
                    SwitchListTile(
                      title: Text('Sí / No'),
                      value: question2Recommendation,
                      onChanged: (value) {
                        setState(() {
                          question2Recommendation = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveSurvey,
        child: Icon(Icons.save),
        tooltip: 'Enviar Encuesta',
      ),
    );
  }
}
