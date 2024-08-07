import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CreatePage extends StatefulWidget {

  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Text('Create new category', style: TextStyle(
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
            SizedBox(
              height: 15,
            ),
            Text('Category name', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white54,
            )),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.name,
              controller: _titleController,
              maxLength: 20,
              style: TextStyle(
                  fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Category name',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
              onChanged: (value) {

              },
            ),
            SizedBox(
              height: 20,
            ),
            Text('Category date', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white54,
            )),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.datetime,
              controller: _dateController,
              maxLength: 20,
              style: TextStyle(
                  fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Category date',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
              onChanged: (value) {

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskList(
                        title: _titleController.text,
                        date: _dateController.text,
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
  final String date;
  const TaskList({Key? key, required this.title, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class TaskBox extends StatelessWidget {
  const TaskBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
