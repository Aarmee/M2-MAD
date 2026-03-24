import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Screen1()));
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen1")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text("Go Screen1")),
            ListTile(
              title: Text("Go Screen2"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Screen2(name.text)));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          TextField(controller: name),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Screen2(name.text)));
              },
              child: Text("Next"))
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  String name;
  Screen2(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen2")),
      body: Column(
        children: [
          Text("Product: $name"),
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Back"))
        ],
      ),
    );
  }
}