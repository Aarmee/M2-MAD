import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FormPage()));
}

// ----------- FORM PAGE -----------
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  String gender = "Male";
  String course = "BCA";
  bool accept = false;

  void submit() {
    if (!accept) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Accept terms")));
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPage(
          name.text,
          email.text,
          gender,
          course,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Form")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Name"),
            TextField(controller: name),

            SizedBox(height: 10),

            Text("Email"),
            TextField(controller: email),

            SizedBox(height: 10),

            Text("Gender"),
            Row(
              children: [
                Radio(
                  value: "Male",
                  groupValue: gender,
                  onChanged: (val) {
                    setState(() => gender = val.toString());
                  },
                ),
                Text("Male"),

                Radio(
                  value: "Female",
                  groupValue: gender,
                  onChanged: (val) {
                    setState(() => gender = val.toString());
                  },
                ),
                Text("Female"),
              ],
            ),

            SizedBox(height: 10),

            Text("Course"),
            DropdownButton<String>(
              value: course,
              items: ["BCA", "MCA", "BTech"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {
                setState(() => course = val!);
              },
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Checkbox(
                  value: accept,
                  onChanged: (val) {
                    setState(() => accept = val!);
                  },
                ),
                Text("Accept Terms")
              ],
            ),

            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: submit,
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ----------- DISPLAY PAGE -----------
class DisplayPage extends StatelessWidget {
  String name, email, gender, course;

  DisplayPage(this.name, this.email, this.gender, this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Column(
        children: [
          Text("Name: $name"),
          Text("Email: $email"),
          Text("Gender: $gender"),
          Text("Course: $course"),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Back"),
          )
        ],
      ),
    );
  }
}