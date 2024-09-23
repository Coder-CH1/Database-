import 'dart:convert';

class Tasks {
  final int id;
  final String title;
  final DateTime date;

  Tasks({required this.id, required this.title, required this.date});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': title,
      'age': date.millisecondsSinceEpoch,
    };
  }

  static Tasks fromMap(Map<String, dynamic> map) {
    return Tasks(
        id: map['id'],
        title: map['title'],
        date: DateTime.fromMicrosecondsSinceEpoch(map['date']),);
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $title, age: $date}';
  }
}

