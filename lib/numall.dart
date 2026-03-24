import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController input = TextEditingController();

  bool prime = false, palindrome = false, armstrong = false, perfect = false;

  String result = "";

  bool isPrime(int n) {
    for (int i = 2; i < n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  bool isPalindrome(int n) {
    int rev = 0, temp = n;
    while (n > 0) {
      rev = rev * 10 + n % 10;
      n ~/= 10;
    }
    return rev == temp;
  }

  bool isArmstrong(int n) {
    int sum = 0, temp = n;
    while (n > 0) {
      int d = n % 10;
      sum += d * d * d;
      n ~/= 10;
    }
    return sum == temp;
  }

  bool isPerfect(int n) {
    int sum = 0;
    for (int i = 1; i < n; i++) {
      if (n % i == 0) sum += i;
    }
    return sum == n;
  }

  void check() {
    int n = int.parse(input.text);
    result = "";

    if (prime) result += isPrime(n) ? "Prime\n" : "Not Prime\n";
    if (palindrome) result += isPalindrome(n) ? "Palindrome\n" : "Not Palindrome\n";
    if (armstrong) result += isArmstrong(n) ? "Armstrong\n" : "Not Armstrong\n";
    if (perfect) result += isPerfect(n) ? "Perfect\n" : "Not Perfect\n";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Number Properties")),
      body: Column(
        children: [
          TextField(controller: input),

          CheckboxListTile(title: Text("Prime"), value: prime,
              onChanged: (v) => setState(() => prime = v!)),
          CheckboxListTile(title: Text("Palindrome"), value: palindrome,
              onChanged: (v) => setState(() => palindrome = v!)),
          CheckboxListTile(title: Text("Armstrong"), value: armstrong,
              onChanged: (v) => setState(() => armstrong = v!)),
          CheckboxListTile(title: Text("Perfect"), value: perfect,
              onChanged: (v) => setState(() => perfect = v!)),

          ElevatedButton(onPressed: check, child: Text("Check")),

          Text(result)
        ],
      ),
    );
  }
}