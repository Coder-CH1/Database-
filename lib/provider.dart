import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class DatabaseProvider with ChangeNotifier {

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
}
Database? _database;
//CRUD OPERATIONS

Future<Task> createTask(Task task) async {
  final db = await _database;
return task;
}

Future<List<Task>> readData() async {
return [];
}

Future<Task> updateData(Task task) async {
return task;
}

Future<bool> deleteData(int id) async {
return true;
}