import 'package:flutter/material.dart';
import 'package:my_app/Lab_4/Lab_Assignment/screens/Gender_Selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Gender_Selection(),
    );
  }
}
