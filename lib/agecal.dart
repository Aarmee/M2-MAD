import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime? selected;
  String result = "";

  void pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => selected = picked);
    }
  }

  void calculate() {
    if (selected == null) return;

    Duration diff = DateTime.now().difference(selected!);

    int years = diff.inDays ~/ 365;

    setState(() {
      result = "Years: $years\nMinutes: ${diff.inMinutes}\nSeconds: ${diff.inSeconds}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Age Calculator")),
      body: Column(
        children: [
          ElevatedButton(onPressed: pickDate, child: Text("Select Date")),
          ElevatedButton(onPressed: calculate, child: Text("Calculate")),
          Text(result)
        ],
      ),
    );
  }
}