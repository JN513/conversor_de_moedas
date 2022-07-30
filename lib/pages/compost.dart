import 'package:conversor_de_moedas/pages/home.dart';
import 'package:conversor_de_moedas/pages/simple.dart';
import 'package:flutter/material.dart';

class CompostPage extends StatefulWidget {
  const CompostPage({super.key});

  @override
  State<CompostPage> createState() => _CompostPageState();
}

class _CompostPageState extends State<CompostPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juros Compostos"),
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
            Text("Juros Compostos"),
          ],
        ),
      ),
    );
  }
}
