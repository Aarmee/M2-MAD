import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController pass = TextEditingController();
  String result = "";

  void check() {
    String p = pass.text;

    bool hasNumber = RegExp(r'[0-9]').hasMatch(p);
    bool hasSpecial = RegExp(r'[@#$]').hasMatch(p);
    bool hasUpper = RegExp(r'[A-Z]').hasMatch(p);

    int score = 0;

    if (p.length > 8) score++;
    if (hasNumber) score++;
    if (hasSpecial) score++;
    if (hasUpper) score++;

    if (score <= 1) result = "Weak";
    else if (score == 2) result = "Normal";
    else if (score == 3) result = "Strong";
    else result = "Very Strong";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password Strength")),
      body: Column(
        children: [
          TextField(controller: pass),
          ElevatedButton(onPressed: check, child: Text("Check")),
          Text(result)
        ],
      ),
    );
  }
}