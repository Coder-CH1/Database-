import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  return await openDatabase(
    'task.db',
    version: 1,
    onCreate: (db, version) {
      db.execute('''
        CREATE TABLE IF NOT EXISTS task (
        id INTEGER PRIMARY KEY,
        title TEXT,
        date TEXT
        )
      ''');
    }
  );
}

Future<List<Map<String, dynamic>>>
getTasks() async {
  final db = await createDatabase();
  return await db.query('task');
}