import 'package:flutter/material.dart';
import 'task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskProvider() {
    loadTasks();
  }

  void addTask(String taskName) {
    final task = Task(name: taskName, isCompleted: false);
    _tasks.add(task);
    saveTasks();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    saveTasks();
    notifyListeners();
  }

  void toggleTaskCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    saveTasks();
    notifyListeners();
  }

  // Guardar las tareas en SharedPreferences
  void saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = _tasks.map((task) => jsonEncode(task.toJson())).toList();
    prefs.setStringList('tasks', taskList);
  }

  // Cargar las tareas desde SharedPreferences
  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList('tasks') ?? [];
    _tasks = taskList.map((task) => Task.fromJson(jsonDecode(task))).toList();
    notifyListeners();
  }
}
