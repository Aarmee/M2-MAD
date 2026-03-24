import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: Screen1()));
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("phone", phone.text);
    prefs.setString("name", name.text);
    prefs.setString("email", email.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Save Contact")),
      body: Column(
        children: [
          TextField(controller: phone),
          TextField(controller: name),
          TextField(controller: email),

          ElevatedButton(onPressed: save, child: Text("Save")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Screen2()));
              },
              child: Text("View"))
        ],
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String data = "";

  void load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data =
          "${prefs.getString("phone")}\n${prefs.getString("name")}\n${prefs.getString("email")}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Contact")),
      body: Column(
        children: [
          ElevatedButton(onPressed: load, child: Text("Load")),
          Text(data)
        ],
      ),
    );
  }
}