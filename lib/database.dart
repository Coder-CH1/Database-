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
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date INTEGER)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Define a function that inserts tasks into the database
  Future<void> insertTasks(Tasks tasks) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Tasks into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same tasks is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'tasks',
      tasks.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the tasks from the dogs table.
  Future<List<Tasks>> tasks() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all the tasks.
    final List<Map<String, Object?>> tasksMaps = await db.query('tasks');

    // Convert the list of each task's fields into a list of `Tasks` objects.
    return [
      // for (final {
      // 'id': id as int,
      // 'title': title as String,
      // 'date': date as DateTime,
      // } in tasksMaps)
      //   Tasks(id: id, title: title, date: date),
    ];
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