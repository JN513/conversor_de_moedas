import 'package:conversor_de_moedas/pages/compost.dart';
import 'package:conversor_de_moedas/pages/home.dart';
import 'package:flutter/material.dart';

class SimplePage extends StatefulWidget {
  const SimplePage({super.key});

  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juros Simples"),
      ),
      drawer: Drawer(
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Juros Simples"),
          ],
        ),
      ),
    );
  }
}
