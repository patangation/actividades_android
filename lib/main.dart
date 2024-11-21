import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'survey_screen.dart';
import 'results_screen.dart';
import 'database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura la inicialización para SQLite
  await DatabaseHelper.instance.database; // Inicializa la base de datos
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta el banner de "Debug"
      title: 'Encuestas de Satisfacción',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Ruta inicial de la app
      routes: {
        '/': (context) => HomeScreen(),
        '/survey': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return SurveyScreen(serviceType: args);
        },
        '/results': (context) => ResultsScreen(),
      },
    );
  }
}


