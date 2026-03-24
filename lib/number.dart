import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatefulWidget{
  @override
 _MyAppState createState() =>_MyAppState();
}

class _MyAppState extends State<MyApp>{
  TextEditingController t1=TextEditingController();
  String result="";
  int fact(int n){
    int f=1;
    for(int i=1;i<=n;i++) f*=i;
    return f;
  }

//Digit → square → sum → repeat
// Stop at:
// 1 → Happy
// 4 → Not Happy
// Input: 19
// Step 1:
// 1² + 9² = 1 + 81 = 82
// Step 2:
// 8² + 2² = 64 + 4 = 68
// Step 3
// 6² + 8² = 36 + 64 = 100
// Step 4:
// 1² + 0² + 0² = 1
// 👉 Final = 1 → Happy Number ✅
  bool isHappy(int n){
    int sum=0;
    while(n!=1 && n!=4){
      sum=0;
      while(n>0){
        int d= n%10;
        sum+=d*d;
        n~/=10;
      }
      n=sum;
    }
    return n==1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Number App")),
      body: Column(
        children: [
          TextField(controller: t1),
          ElevatedButton(onPressed: (){
            int n=int.parse(t1.text);
            setState(()=>result="Fact= ${fact(n)}");
          }, child: Text("Factorial")),

           ElevatedButton(onPressed: (){
            int n=int.parse(t1.text);
            setState(()=>result=(n%2==0)?"Even":"Odd");
          }, child: Text("Even/Odd")),

           ElevatedButton(onPressed: (){
            int n=int.parse(t1.text);
            setState(()=>result=isHappy(n)?"Happy":"Not happy");
          }, child: Text("Happy")),
          Text(result)
        ],
      ),
    );
  }
}