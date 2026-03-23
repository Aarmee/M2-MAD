import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  void save() async {
    File file = File("student.txt");
    await file.writeAsString("${name.text},${email.text}\n", mode: FileMode.append);
  }

  void read() async {
    File file = File("student.txt");
    String data = await file.readAsString();
    show(data);
  }

  void show(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File Save")),
      body: Column(
        children: [
          TextField(controller: name),
          TextField(controller: email),

          ElevatedButton(onPressed: save, child: Text("Save")),
          ElevatedButton(onPressed: read, child: Text("Read")),
        ],
      ),
    );
  }
}