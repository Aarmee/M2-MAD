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
  String result = "";
  String choice = "INR→USD";

  void convert() {
    double n = double.parse(input.text);
    double res = 0;

    if (choice == "INR→USD") res = n / 83;
    if (choice == "USD→INR") res = n * 83;
    if (choice == "INR→EUR") res = n / 90;
    if (choice == "INR→GBP") res = n / 100;

    setState(() => result = "Result: $res");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Currency")),
      body: Column(
        children: [
          TextField(controller: input),

          DropdownButton<String>(
            value: choice,
            items: ["INR→USD", "USD→INR", "INR→EUR", "INR→GBP"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) => setState(() => choice = v!),
          ),

          ElevatedButton(onPressed: convert, child: Text("Convert")),
          Text(result)
        ],
      ),
    );
  }
}