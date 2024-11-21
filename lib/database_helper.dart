import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('surveys.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE surveys (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        serviceType TEXT NOT NULL,
        question1 INTEGER NOT NULL,
        question2 TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertSurvey(Map<String, dynamic> data) async {
    final db = await instance.database;
    return await db.insert('surveys', data);
  }

  Future<List<Map<String, dynamic>>> getSurveys() async {
    final db = await instance.database;
    return await db.query('surveys');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
