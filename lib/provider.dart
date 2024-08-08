import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class DatabaseProvider with ChangeNotifier {
  final String _taskName = 'task';
  Future<Database> createDatabase() async {
    return await openDatabase(
        '$_taskName.db',
        version: 2,
        onCreate: (db, version) {
          db.execute('''
        CREATE TABLE $_taskName (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT NOT NULL,
        date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
      ''');
        }
    );
  }

  Future<List<Map<String, dynamic>>>
  getTasks() async {
    final db = await createDatabase();
    return await db.query(_taskName);
  }

  Database? _database;

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
    final db = await getDb();
    final id = await db.insert(_taskName, task.toJson());
    return Task(id: id, title: task.title, date: task.date);
  }

  Future<List<Task>> readData() async {
    final db = await getDb();
    final tasks = await db.query(_taskName);
    return tasks.map((task) => Task.fromJson(task)).toList();
  }

  Future<Task> updateData(Task task) async {
    final db = await getDb();
  await db.update(_taskName, task.toJson(), where: 'id = ?', whereArgs: [(task.id)]);
    return task;
  }

  Future<bool> deleteData(int id) async {
    final db = await getDb();
final result = await db.delete(_taskName, where: 'id = ?', whereArgs: [id]);
    return result > 0;
  }

}