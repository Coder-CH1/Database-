import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class DatabaseProvider with ChangeNotifier {
  Database? _database;

  Future<Database> getDb() async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return await openDatabase(
      'task.db',
      version: 1,
      onCreate: (db, version) {

      },
    );
  }

//CRUD OPERATIONS

  Future<Task> createTask(Task task) async {
    final db = await getDb();
    final id = await db.insert('task', task.toJson());
    return Task(id: id, title: task.title, date: task.date);
  }

  Future<List<Task>> readData() async {
    final db = await getDb();
    final tasks = await db.query('task');
    return tasks.map((task) => Task.fromJson(task)).toList();
  }

  Future<Task> updateData(Task task) async {
    return task;
  }

  Future<bool> deleteData(int id) async {
    return true;
  }

}