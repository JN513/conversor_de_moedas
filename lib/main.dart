import 'package:finance_utilities/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Finance_Utilities());
}

class Finance_Utilities extends StatelessWidget {
  const Finance_Utilities({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Utilities',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

