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
  int choice = 1;

  void convert() {
    double n = double.parse(input.text);
    double res = 0;

    if (choice == 1) res = n / 83;
    if (choice == 2) res = n * 83;
    if (choice == 3) res = n / 90;
    if (choice == 4) res = n / 100;

    setState(() => result = "Result: $res");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Currency")),
      body: Column(
        children: [
          TextField(controller: input),

          RadioListTile(title: Text("INR → USD"), value: 1, groupValue: choice,
              onChanged: (v) => setState(() => choice = v!)),
          RadioListTile(title: Text("USD → INR"), value: 2, groupValue: choice,
              onChanged: (v) => setState(() => choice = v!)),
          RadioListTile(title: Text("INR → EUR"), value: 3, groupValue: choice,
              onChanged: (v) => setState(() => choice = v!)),
          RadioListTile(title: Text("INR → GBP"), value: 4, groupValue: choice,
              onChanged: (v) => setState(() => choice = v!)),

          ElevatedButton(onPressed: convert, child: Text("Convert")),
          Text(result)
        ],
      ),
    );
  }
}