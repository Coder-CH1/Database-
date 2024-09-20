import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'model.dart';

//Database
class DatabaseProvider with ChangeNotifier {
  final String _taskName = 'task';
  Database? _database;
  Future<Database> createDatabase() async {
    return await openDatabase(
        '$_taskName.db',
        version: 1,
        onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $_taskName (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT NOT NULL,
        date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
      ''');
        print('Table $_taskName created');
        }
    );
  }

  Future<List<Map<String, dynamic>>>
  getTasks() async {
    final db = await createDatabase();
    return await db.query(_taskName);
  }

  Future<Database> initDatabase() async {
    return createDatabase();
  }

  Future<Database> getDb() async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

//CRUD OPERATIONS
  Future<Task> createTask(Task task) async {
    try {
      final db = await getDb();
      final id = await db.insert(_taskName, task.toJson());
      return Task(id: id, title: task.title, date: task.date);
    } catch (e) {
      throw Exception('error creating task: $e');
    }
  }

  Future<List<Task>> readData() async {
    try {
    final db = await getDb();
    final tasks = await db.query(_taskName);
    return tasks.map((task) => Task.fromJson(task)).toList();
    } catch (e) {
      throw Exception('error creating task: $e');
    }
  }

  Future<Task> updateData(Task task) async {
    try {
    final db = await getDb();
  await db.update(_taskName, task.toJson(), where: 'id = ?', whereArgs: [(task.id)]);
    return task;
    } catch (e) {
      throw Exception('error creating task: $e');
    }
  }

  Future<bool> deleteData(int id) async {
    try {
    final db = await getDb();
final result = await db.delete(_taskName, where: 'id = ?', whereArgs: [id]);
    return result > 0;
    } catch (e) {
      throw Exception('error creating task: $e');
    }
  }

}