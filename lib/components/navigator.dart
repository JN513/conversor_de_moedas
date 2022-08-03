import 'package:finance_utilities/pages/home.dart';
import 'package:finance_utilities/pages/simple.dart';
import 'package:finance_utilities/pages/compost.dart';
import 'package:finance_utilities/pages/about.dart';
import 'package:flutter/material.dart';


Drawer Header (context){
  return Drawer(
    child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bitcoin.jpg'),
                fit: BoxFit.cover,
              ),
              color: Colors.blue,
            ),
            child: Text('Finance Utilities',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )
            ),
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
          ListTile(
            title: const Text('Sobre'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ]
    ),
  );
}