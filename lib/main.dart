import 'package:database/create.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Tasks> tasks = [];
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
      body: Container(
        height: 700,
        width: 400,
        color: Colors.black12,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 20, bottom: 20, right: 20),
              child: Text('Choose category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  )
              ),
            ),
           const Divider(
            height: 1,
            color: Colors.white54,
           ),
           tasks.isNotEmpty
            ? TaskList(tasks: tasks)
            : const Text('Task not available'),
           SizedBox(
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
                 onPressed: () {
                   Navigator.of(context).push(
                     MaterialPageRoute(builder: (context) => const CreatePage()),
                   );
                 }
             ),
           )
          ],
        ),
      ),
      //floatingActionButton: ,
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
