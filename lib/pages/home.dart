import 'package:conversor_de_moedas/core/api_client.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var from = "USD";
  var to = "BRL";
  var num = 0.0;

  void setToCoin(String? value){
    setState(){
      to = value ?? "BRL";
    }
  }

  void setFromCoin(String? value){
    setState(){
      from = value ?? "USD";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Converter moeda:',
            ),

            // Moeda a se converter

            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'De:',
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      child: DropdownButton<String>(
                        value: from,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value){
                          setFromCoin(value);
                        },
                        items: <String>[
                          "USD",
                          "BRL",
                          "EUR",
                          "BTC",
                          "ADA",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  ]
              ),
            ),

            // Valor a se inserir

            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                onChanged: (String? value){

                },
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Value',
                ),
              ),
            ),

            // Moeda para qual sera convertido

            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Para:',
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      child: DropdownButton<String>(
                        value: to,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value){
                          setToCoin(value);
                        },
                        items: <String>[
                          "USD",
                          "BRL",
                          "EUR",
                          "BTC",
                          "ADA"
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  ]
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              child: Text(
                "0.0",
              ),
            )
          ],
        ),
      ),
    );
  }
}
