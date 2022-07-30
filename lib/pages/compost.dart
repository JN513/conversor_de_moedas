import 'package:conversor_de_moedas/components/navigator.dart';
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
      drawer: Header(context),
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
