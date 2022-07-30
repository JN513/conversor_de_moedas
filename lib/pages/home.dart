import 'package:conversor_de_moedas/core/api_client.dart';
import 'package:conversor_de_moedas/pages/compost.dart';
import 'package:conversor_de_moedas/pages/simple.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _textController = new TextEditingController();
  var from = "USD";
  var to = "BRL";
  var num = 0.0;

  Future<void> convert(String? value) async{
    double qtd = double.parse(value!);
    var valor = await getCurrentCotation(from, to);

    setState((){
      num = qtd * valor;
    });
  }

  void setToCoin(String? value){
    _textController.clear();

    setState((){
      to = value!;
      num = 0.0;
    });
  }

  void setFromCoin(String? value){
    _textController.clear();

    setState((){
      from = value!;
      num = 0.0;
    });
  }

  void buttonEvent(){
    convert(_textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de moedas."),
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
            const Text(
              'Converter moeda:',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
              ),
            ),

            // Moeda a se converter

            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'De:',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      child: DropdownButton<String>(
                        value: from,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple, fontSize:  30),
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
                controller: _textController,
                onSubmitted: (String? value){
                    convert(value);
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
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      child: DropdownButton<String>(
                        value: to,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple, fontSize: 30),
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
                "$num",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              child: ElevatedButton(
                child: Text(
                  "Converter",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: buttonEvent,//evento do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}
