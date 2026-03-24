import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  void check() {
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name.text)) {
      show("Invalid Name");
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email.text)) {
      show("Invalid Email");
    } else if (!RegExp(r'^[0-9]+$').hasMatch(phone.text)) {
      show("Invalid Phone Number");
    } else if (pass.text.length <= 8) {
      show("Password must be > 8 characters");
    } else if (pass.text != confirmPass.text) {
      show("Passwords do not match");
    } else {
      show("Success");
    }
  }

  void show(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  InputDecoration box(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(),
    );
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Form")),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: email,
              decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phone,
              decoration: InputDecoration(labelText: "Phone", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: confirmPass,
              obscureText: true,
              decoration: InputDecoration(labelText: "Confirm Password", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: check,
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}