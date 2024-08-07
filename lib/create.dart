import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final dateFormat = DateFormat('yyyy-MM-dd');

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
                child: const Text('Create', style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.white54,
                )),
                onPressed: () {
                  final date = dateFormat.parse(_dateController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskList(
                        title: _titleController.text,
                        date: date,
                      ),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final String title;
  final DateTime date;
  const TaskList({Key? key, required this.title, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
backgroundColor: Colors.black26,
  ),
      backgroundColor: Colors.black87,
      body: GridView.count(crossAxisCount: 2,
      children: [
        TaskBox(title, date),
      ],
      ),
    );
  }
}

class TaskBox extends StatelessWidget {
  final String title;
  final DateTime date;
  const TaskBox(this.title, this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text('$title - ${DateFormat('yyyy-MM-dd').format(date)}', style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
