import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

  String result = "";
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: SingleChildScrollView( // 🔥 prevents overflow
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: user,
              decoration: InputDecoration(labelText: "Username"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: pass,
              obscureText: true, // 🔥 password hidden
              decoration: InputDecoration(labelText: "Password"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),

            SizedBox(height: 10),

            SwitchListTile(
              title: Text("Remember Me"),
              value: remember,
              onChanged: (val) {
                setState(() {
                  remember = val;
                });
              },
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                if (user.text.isEmpty ||
                    pass.text.isEmpty ||
                    email.text.isEmpty) {
                  setState(() => result = "All fields are required");
                } else if (pass.text.length <= 8) {
                  setState(() => result = "Password must be > 8 characters");
                } else if (!email.text.contains("@")) {
                  setState(() => result = "Invalid email");
                } else {
                  setState(() => result = "Registration successful ✅");
                }
              },
              child: Text("Submit"),
            ),

            SizedBox(height: 10),

            Text(
              result,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}