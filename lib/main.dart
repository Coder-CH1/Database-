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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
              padding: EdgeInsets.only(top: 50, left: 20, bottom: 20),
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
           const SizedBox(
             height: 500,
           ),
           SizedBox(
             width: 80,
             height: 50,
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.white10,
               ),
               child: Text('Add', style: TextStyle(
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
    );
  }
}
