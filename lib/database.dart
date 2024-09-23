
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';
import 'dart:async';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    join(await getDatabasesPath(), ''),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date INTEGER)',
      );
    },

    version: 1,
  );

  // Define a function that inserts tasks into the database
  Future<void> insertTasks(Tasks tasks) async {
    // Get a reference to the database.
    final db = await database;

    await db.insert(
      'tasks',
      tasks.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTasks(Tasks tasks) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Tasks.
    await db.update(
      'tasks',
      tasks.toMap(),
      // Ensure that the Tasks has a matching id.
      where: 'id = ?',
      // Pass the Task's id as a whereArg to prevent SQL injection.
      whereArgs: [tasks.id],
    );
  }

  Future<void> deleteTasks(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Tasks from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific tasks.
      where: 'id = ?',
      // Pass the Tasks's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
