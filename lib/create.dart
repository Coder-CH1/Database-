import 'package:flutter/material.dart';
import 'main.dart';

class CreatePage extends StatefulWidget {

  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Text('Create new category', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white54,
            )),
            SizedBox(
              height: 15,
            ),
            Text('Category name', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white54,
            )),
            TextField(
              controller: _controller,
              maxLength: 20,
              style: TextStyle(
                fontSize: 18),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white30)
                ),
                hintText: ''
              ),
              onChanged: (value) {

              },
            )
          ],
        ),
      ),
    );
  }
}
