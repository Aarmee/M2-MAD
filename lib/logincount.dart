import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  void increment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    count = prefs.getInt("count") ?? 0;
    count++;
    prefs.setInt("count", count);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Count")),
      body: Center(
        child: Text("Login Count: $count"),
      ),
    );
  }
}