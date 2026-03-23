import 'package:flutter/material.dart';
import 'dart:math';

import 'package:practical/main.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  TextEditingController t1=TextEditingController();
  String result="";
  
  int fact(int n){
    int f=1;
    for(int i=1;i<=n;i++) f*=i;
    return f;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Calculator")),
      body: Column(
        children: [
          TextField(controller: t1),
          ElevatedButton(onPressed: (){
            double n=double.parse(t1.text);
            setState(()=>result="Square=${n*n}");
          }, child: Text("Square")),
           ElevatedButton(onPressed: (){
            double n=double.parse(t1.text);
            setState(()=>result="Sqrt=${sqrt(n)}");
          }, child: Text("Sqrt")),
           ElevatedButton(onPressed: (){
            double n=double.parse(t1.text);
            setState(()=>result="Cube=${n*n*n}");
          }, child: Text("Cube")),
           ElevatedButton(onPressed: (){
            double n=double.parse(t1.text);
            setState(()=>result="Log=${log(n)}");
          }, child: Text("Log")),
           ElevatedButton(onPressed: (){
            int n=int.parse(t1.text);
            setState(()=>result="Fact=${fact(n)}");
          }, child: Text("Factorial")),
           ElevatedButton(onPressed: (){
            double n=double.parse(t1.text);
            setState(()=>result="CubeRoot=${pow(n,1/3)}");
          }, child: Text("CubeRoot")),
          Text(result)
        ],
      ),
    );
  }
}