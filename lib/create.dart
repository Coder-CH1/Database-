import 'package:flutter/material.dart';
import 'main.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
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
            ))
          ],
        ),
      ),
    );
  }
}
