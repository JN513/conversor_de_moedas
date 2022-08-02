import 'package:finance_utilities/pages/home.dart';
import 'package:finance_utilities/pages/simple.dart';
import 'package:finance_utilities/pages/compost.dart';
import 'package:flutter/material.dart';


Drawer Header (context){
  return Drawer(
    child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Converter moedas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Calculadora de juros simples'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SimplePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Calculadora de juros compostos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CompostPage()),
              );
            },
          ),
        ]
    ),
  );
}