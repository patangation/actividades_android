import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encuestas de Satisfacción'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.blue[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Seleccione el tipo de servicio',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Tarjetas para cada tipo de servicio
              ServiceCard(
                icon: Icons.build,
                title: 'Industrial',
                onPressed: () => Navigator.pushNamed(context, '/survey', arguments: 'Industrial'),
              ),
              SizedBox(height: 10),
              ServiceCard(
                icon: Icons.store,
                title: 'Comercial',
                onPressed: () => Navigator.pushNamed(context, '/survey', arguments: 'Comercial'),
              ),
              SizedBox(height: 10),
              ServiceCard(
                icon: Icons.home,
                title: 'Residencial',
                onPressed: () => Navigator.pushNamed(context, '/survey', arguments: 'Residencial'),
              ),
              SizedBox(height: 20),
              // Botón para ver resultados
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/results'),
                child: Text('Ver Resultados'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: Colors.blue[700], // Cambiado de primary a backgroundColor
                  foregroundColor: Colors.white, // Cambiado de onPrimary a foregroundColor
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget para la tarjeta de servicio
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(title, style: TextStyle(fontSize: 20)),
        trailing: Icon(Icons.arrow_forward),
        onTap: onPressed,
      ),
    );
  }
}

