import 'package:conversor_de_moedas/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Conversor());
}

class Conversor extends StatelessWidget {
  const Conversor({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: "Conversor de moedas."),
    );
  }
}

