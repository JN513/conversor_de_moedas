import 'package:finance_utilities/core/api_client.dart';
import 'package:finance_utilities/components/navigator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _textController = TextEditingController();
  var from = "USD";
  var to = "BRL";
  var num = 0.0;
  var cotation = 0.0;

  void convert(String? value)   {
    double qtd = double.parse(value!);

    setState((){
      if(_textController.text.isEmpty){
        num = 0.0;
      } else {
        num = qtd * cotation;
      }
    });
  }

  Future<void> updateCotation() async {
    cotation = await getCurrentCotation(from, to);
  }

  void setToCoin(String? value){
    _textController.clear();

    setState((){
      to = value!;
      num = 0.0;
    });

    updateCotation();
  }

  void setFromCoin(String? value) {
    _textController.clear();

    setState((){
      from = value!;
      num = 0.0;
    });

    updateCotation();
  }

  void buttonEvent(){
    convert(_textController.text);
  }

  @override
  void initState(){
    super.initState();

    updateCotation();

    setState((){
      num = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de moedas."),
      ),
      drawer: Header(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Converter moeda:',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),

              // Moeda a se converter

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'De:',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                        child: DropdownButton<String>(
                          value: from,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black, fontSize:  30),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
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
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextField(
                  controller: _textController,
                  onChanged: (String? value){
                    convert(value);
                  },
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Value',
                  ),
                ),
              ),

              // Moeda para qual sera convertido

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Para:',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                        child: DropdownButton<String>(
                          value: to,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black, fontSize: 30),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
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
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Text(
                  "${num.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
