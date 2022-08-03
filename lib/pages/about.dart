import 'package:finance_utilities/components/navigator.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre."),
      ),
      drawer: Header(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Finance Utilities",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Versão: 0.0.2",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Desenvolvido por:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Julio Nunes Avelar",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Licença: MIT",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Copyright © 2022",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              // Url repository text

            ],
          ),
        ),
      ),
    );
  }
}
