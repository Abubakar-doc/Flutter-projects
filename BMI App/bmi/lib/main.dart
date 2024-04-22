import 'package:flutter/material.dart';
import 'package:bmi/screens/Gender_Selection.dart';

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
