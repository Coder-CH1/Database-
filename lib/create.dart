import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final dateFormat = DateFormat('dd MMMM yyyy');
  List<Tasks> taskLists = [];

  @override
  void initState() {
    super.initState();
   _fetchTasks();
  }

  Future<void> _fetchTasks() async{
   taskLists = await DataBaseManager.instance.fetchTasks();
   setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: const Text('Create new category', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white54,
        )),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text('Category name', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white54,
            )),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.name,
              controller: _titleController,
              maxLength: 20,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.cyanAccent
              ),
              decoration: const InputDecoration(
                hintText: 'Category name',
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
              onChanged: (value) {
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Category date', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white54,
            )),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.datetime,
              controller: _dateController,
              maxLength: 20,
              style: const TextStyle(
                  fontSize: 18,
                color: Colors.cyanAccent,
              ),
              decoration: const InputDecoration(
                hintText: 'Category date',
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
              onChanged: (value) {
              },
              readOnly: true,
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1930),
                    lastDate: DateTime(2025)
                );
                if (pickedDate != null) {
                  setState(() {
                    _dateController.text = dateFormat.format(pickedDate);
                  });
                }
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white10,
                ),
                child: Text('Create', style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.white54,
                )),
                onPressed: () async {

                  if(_titleController.text.isEmpty || _dateController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all fields')),
                    );
                    return;
                  }
                  DateTime selectedDate = dateFormat.parse(_dateController.text);
                  final newTask = Tasks(id: 0, title: _titleController.text, date: selectedDate);
                 try {
                   await DataBaseManager.instance.insertTasks(newTask);
                   await _fetchTasks();
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => TaskList(tasks: taskLists),
                       )
                   );
                 } catch (e) {
                  //print('Error inserting task: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error creating tasks')),
                  );
                 }
                },
            ),
          ],
        ),
      ),
    );
  }
}

//
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
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
