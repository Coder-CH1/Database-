import 'dart:js';

import 'package:database/create.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //double screenWidth = MediaQuery.of(context).size.width * 1.0;
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: Text('Task Category',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ) ),
      ),
      backgroundColor: Colors.black54,
      body: Container(
        height: 500,
        width: 400,
        color: Colors.orangeAccent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text('Create task',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54,
                  )
              ),
            ),
            SizedBox(
              height: 50,
            ),
           SizedBox(
             width: 50,
             height: 50,
             child: ElevatedButton(
               child: Icon(Icons.add),
                 onPressed: () {
                   Navigator.push(
                       context,
                     MaterialPageRoute(builder: (context) => CreatePage()),
                   );
                 }
             ),
           )
          ],
        ),
      ),
    );
  }
}
