import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';
import 'dart:async';

/// INSTANTIATE THE DATABASE
class DataBaseManager {
  static final DataBaseManager instance = DataBaseManager();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// OPEN THE DATABASE AND CREATE THE TABLE DATA
  Future<Database> _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'tasks_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date INTEGER)',
        );
      },
      version: 1,
    );
  }

  /// INSERT THE DATA
  Future<void> insertTasks(Tasks tasks) async {
    final db = await database;
    await db.insert(
      'tasks',
      tasks.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// FETCH THE DATA
  Future<List<Tasks>> fetchTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return Tasks.fromMap(maps[i]);
    });
  }

  /// UPDATE THE DATA
  Future<void> updateTasks(Tasks tasks) async {
    final db = await database;
    await db.update(
      'tasks',
      tasks.toMap(),
      where: 'id = ?',
      whereArgs: [tasks.id],
    );
  }

  /// DELETE THE DATA
  Future<void> deleteTasks(int id) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
