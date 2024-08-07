import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class DatabaseProvider with ChangeNotifier {
  Database? db;
  Future<Database> getDb() async {
    if (db != null) return db!;
    db = await initDatabase();
    return db!;
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

//CRUD OPERATIONS

Future<Task> createTask(Task task) async {
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