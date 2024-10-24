import 'package:database/create.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(tasks: [],),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<Tasks> tasks;
  const MyHomePage({Key? key, required this.tasks}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tasks> taskLists = [];
  @override
  void initState() {
    super.initState();
      _fetchTasks();
  }

  Future<void> _fetchTasks() async{
    taskLists = await DataBaseManager.instance.fetchTasks();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text('Task Category',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ) ),
      ),
      backgroundColor: Colors.black54,
      body: Column(
        children: [
         const Divider(
          height: 1,
          color: Colors.white54,
         ),
         const SizedBox(height: 20),
         widget.tasks.isNotEmpty
          ? Expanded(
            child: GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               childAspectRatio: 2.5,
             ),
             itemCount: widget.tasks.length,
             itemBuilder: (context, index) {
               return ListView(
                   children: [
                     TaskBox(
                       widget.tasks[index].title,
                       widget.tasks[index].date,
                     ),
                   ]
               );
             },
                       ),
          )
          : const Text('Task not available'),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 150, left: 150),
        child: SizedBox(
          width: 80,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white10,
              ),
              child: const Text('Add', style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white54,
              ),
              ),
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CreatePage()),
                );
                await _fetchTasks();
              }
          ),
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<Tasks> tasks;
  const TaskList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
      ),
      backgroundColor: Colors.black87,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
        ),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListView(
              children: [
                TaskBox(
                  tasks[index].title,
                  tasks[index].date,
                ),
              ]
          );
        },
      ),
    );
  }
}

//
class TaskBox extends StatelessWidget {
  final String title;
  final DateTime date;
  const TaskBox(this.title, this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$title - ${DateFormat('dd MMMM yyyy').format(date)}', style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
      ),
      tileColor: Colors.blueAccent,
    );
  }
}
