import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController principal = TextEditingController();

  double rate = 5;
  bool compound = false;
  String result = "";

  void calculate() {
    double p = double.parse(principal.text);
    double r = rate / 100;
    double t = 1;

    double interest;

    if (!compound) {
      interest = p * r * t;
    } else {
      interest = p * (pow(1 + r, t) - 1);
    }

    setState(() => result = "Interest: $interest");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Interest")),
      body: Column(
        children: [
          TextField(controller: principal),

          Slider(
            value: rate,
            min: 5,
            max: 20,
            divisions: 15,
            label: "$rate%",
            onChanged: (v) => setState(() => rate = v),
          ),

          SwitchListTile(
            title: Text("Compound"),
            value: compound,
            onChanged: (v) => setState(() => compound = v),
          ),

          ElevatedButton(onPressed: calculate, child: Text("Calculate")),
          Text(result)
        ],
      ),
    );
  }
}