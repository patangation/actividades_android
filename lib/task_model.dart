class Task {
  String name;
  bool isCompleted;

  Task({required this.name, required this.isCompleted});

  // Convertir a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isCompleted': isCompleted,
    };
  }

  // Crear una tarea desde un mapa JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      isCompleted: json['isCompleted'],
    );
  }
}
