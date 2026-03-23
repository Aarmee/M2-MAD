import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController m1 = TextEditingController();
  TextEditingController m2 = TextEditingController();
  TextEditingController m3 = TextEditingController();

  int total = 0;
  double avg = 0;
  String grade = "";

  void calculate() {
    int a = int.parse(m1.text);
    int b = int.parse(m2.text);
    int c = int.parse(m3.text);

    total = a + b + c;
    avg = total / 3;

    if (avg >= 75) grade = "A";
    else if (avg >= 60) grade = "B";
    else grade = "C";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Marks")),
      body: Column(
        children: [
          TextField(controller: m1, decoration: InputDecoration(labelText: "M1")),
          TextField(controller: m2, decoration: InputDecoration(labelText: "M2")),
          TextField(controller: m3, decoration: InputDecoration(labelText: "M3")),

          ElevatedButton(onPressed: calculate, child: Text("Calculate")),

          DataTable(columns: [
            DataColumn(label: Text("Total")),
            DataColumn(label: Text("Average")),
            DataColumn(label: Text("Grade")),
          ], rows: [
            DataRow(cells: [
              DataCell(Text("$total")),
              DataCell(Text("$avg")),
              DataCell(Text(grade)),
            ])
          ])
        ],
      ),
    );
  }
}