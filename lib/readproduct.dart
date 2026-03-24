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
  List<String> data = [];

  void load() async {
    File file = File("products.txt");
    String content = await file.readAsString();
    setState(() {
      data = content.split("\n");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Column(
        children: [
          ElevatedButton(onPressed: load, child: Text("Load")),

          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return ListTile(title: Text(data[i]));
              },
            ),
          )
        ],
      ),
    );
  }
}