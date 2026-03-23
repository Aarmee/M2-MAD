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

    if (choice == 1) res = n * 2.2;
    if (choice == 2) res = n * 5280;
    if (choice == 3) res = n * 4.184;
    if (choice == 4) res = n * 3600;

    output.text = res.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unit Conversion")),
      body: Column(
        children: [
          TextField(controller: input),

          RadioListTile(title: Text("Kg → lbs"), value: 1, groupValue: choice,
              onChanged: (val) => setState(() => choice = val!)),

          RadioListTile(title: Text("Mile → Feet"), value: 2, groupValue: choice,
              onChanged: (val) => setState(() => choice = val!)),

          RadioListTile(title: Text("KCal → KJ"), value: 3, groupValue: choice,
              onChanged: (val) => setState(() => choice = val!)),

          RadioListTile(title: Text("Wh → Joule"), value: 4, groupValue: choice,
              onChanged: (val) => setState(() => choice = val!)),

          ElevatedButton(onPressed: convert, child: Text("Convert")),

          TextField(controller: output),
        ],
      ),
    );
  }
}