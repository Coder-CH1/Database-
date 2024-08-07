import 'package:flutter/material.dart';

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
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.name,
              controller: _controller,
              maxLength: 20,
              style: TextStyle(
                fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Category name',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
              onChanged: (value) {

              },
            ),
            Text('Category icon', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white54,
            )
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: Text('Choose icon from library', style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.white54,
                )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreatePage()),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
