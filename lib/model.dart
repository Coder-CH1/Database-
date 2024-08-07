import 'dart:convert';

class Task {
  final int id;
  final String title;
  final DateTime date;

  Task({required this.id, required this.title, required this.date});

  factory Task.fromJson(Map<String,dynamic>json) {
    return Task(
        id: json['id'],
        title: json['title'],
        date: DateTime.parse(json['date']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
    };
  }
}

