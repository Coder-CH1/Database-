import 'dart:convert';

class Tasks {
  final int id;
  final String title;
  final DateTime date;

  Tasks({required this.id, required this.title, required this.date});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'age': date.millisecondsSinceEpoch,
    };
  }

  static Tasks fromMap(Map<String, dynamic> map) {
    return Tasks(
        id: map['id'],
        title: map['title'],
        date: DateTime.fromMicrosecondsSinceEpoch(map['date']),);
  }

  @override
  String toString() {
    return 'Dog{id: $id, title: $title, age: $date}';
  }
}
