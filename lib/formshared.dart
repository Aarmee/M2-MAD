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
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool remember = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user.text = prefs.getString("user") ?? "";
      pass.text = prefs.getString("pass") ?? "";
      remember = prefs.getBool("remember") ?? false;
    });
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (remember) {
      prefs.setString("user", user.text);
      prefs.setString("pass", pass.text);
      prefs.setBool("remember", true);
    }
  }

  void check() {
    if (user.text.isEmpty || pass.text.isEmpty) {
      show("Fields cannot be empty");
    } else if (pass.text.length <= 8) {
      show("Password > 8 required");
    } else {
      saveData();
      show("Success");
    }
  }

  void show(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: [
          TextField(controller: user, decoration: InputDecoration(labelText: "Username")),
          TextField(controller: pass, decoration: InputDecoration(labelText: "Password")),
          
          SwitchListTile(
            title: Text("Remember Me"),
            value: remember,
            onChanged: (val) {
              setState(() => remember = val);
            },
          ),

          ElevatedButton(onPressed: check, child: Text("Login"))
        ],
      ),
    );
  }
}

