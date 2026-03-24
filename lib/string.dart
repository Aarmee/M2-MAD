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

  bool words = false, chars = false, space = false, reverse = false;

  String result = "";

  void process() {
    String text = input.text;

    if (words) result += "Words: ${text.split(" ").length}\n";
    if (chars) result += "Chars: ${text.length}\n";
    if (space) result += "Spaces: ${text.split(" ").length - 1}\n";
    if (reverse) result += "Reverse: ${text.split('').reversed.join()}\n";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("String App")),
      body: Column(
        children: [
          TextField(controller: input),

          CheckboxListTile(title: Text("Words"), value: words,
              onChanged: (v) => setState(() => words = v!)),

          CheckboxListTile(title: Text("Chars"), value: chars,
              onChanged: (v) => setState(() => chars = v!)),

          CheckboxListTile(title: Text("Spaces"), value: space,
              onChanged: (v) => setState(() => space = v!)),

          CheckboxListTile(title: Text("Reverse"), value: reverse,
              onChanged: (v) => setState(() => reverse = v!)),

          ElevatedButton(onPressed: process, child: Text("Display")),

          Text(result)
        ],
      ),
    );
  }
}