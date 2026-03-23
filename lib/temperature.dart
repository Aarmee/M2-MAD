import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController input = TextEditingController();
  TextEditingController output = TextEditingController();

  int choice = 1;

  void convert() {
    double n = double.parse(input.text);
    double res = 0;

    if (choice == 1) res = (n * 9 / 5) + 32;
    if (choice == 2) res = (n - 32) * 5 / 9;
    if (choice == 3) res = n + 273;

    output.text = res.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Temperature")),
      body: Column(
        children: [
          TextField(controller: input, decoration: InputDecoration(labelText: "Input")),
          
          RadioListTile(
            title: Text("C → F"),
            value: 1,
            groupValue: choice,
            onChanged: (val) => setState(() => choice = val!),
          ),
          RadioListTile(
            title: Text("F → C"),
            value: 2,
            groupValue: choice,
            onChanged: (val) => setState(() => choice = val!),
          ),
          RadioListTile(
            title: Text("C → K"),
            value: 3,
            groupValue: choice,
            onChanged: (val) => setState(() => choice = val!),
          ),

          ElevatedButton(onPressed: convert, child: Text("Convert")),

          TextField(controller: output, decoration: InputDecoration(labelText: "Result")),
        ],
      ),
    );
  }
}