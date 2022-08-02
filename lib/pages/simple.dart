import 'package:finance_utilities/components/navigator.dart';
import 'package:flutter/material.dart';

class SimplePage extends StatefulWidget {
  const SimplePage({super.key});

  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {

  final TextEditingController _initialValueTextControler = TextEditingController();
  final TextEditingController _rateTextControler = TextEditingController();
  final TextEditingController _periodValueTextControler = TextEditingController();
  final TextEditingController _finalValueTextControler = TextEditingController();

  @override
  void initState() {
    super.initState();
     setState(() {
       _initialValueTextControler.text = "0";
       _rateTextControler.text = "0";
       _periodValueTextControler.text = "0";
       _finalValueTextControler.text = "0";
     });
  }

  void calculate() {
    String initialValueText = _initialValueTextControler.text;
    String rateText = _rateTextControler.text;
    String periodText = _periodValueTextControler.text;
    String finalValueText = _finalValueTextControler.text;

    double initialValue = 0.0;
    double rate = 0.0;
    double period = 0.0;
    double finalValue = 0.0;

    if(initialValueText.isEmpty) {
      initialValue = 0.0;
    } else {
      initialValue = double.parse(initialValueText);
    }

    if(rateText.isEmpty) {
      rate = 0.0;
    } else {
      rate = double.parse(rateText);
    }

    if(periodText.isEmpty) {
      period = 0.0;
    } else {
      period = double.parse(periodText);
    }

    if(finalValueText.isEmpty) {
      finalValue = 0.0;
    } else {
      finalValue = double.parse(finalValueText);
    }

    if(initialValue == 0 && rate == 0 && period == 0 && finalValue == 0) {
      return;
    } else if( initialValue == 0 && rate != 0 && period != 0 && finalValue != 0) {
      setState(() {
        _initialValueTextControler.text = (finalValue / (1 + (rate / 100) * period)).toString();
      });
    } else if( initialValue != 0 && rate == 0 && period != 0 && finalValue != 0) {
      setState(() {
        _rateTextControler.text = ((finalValue / initialValue - 1) / period).toString();
      });
    } else if( initialValue != 0 && rate != 0 && period == 0 && finalValue != 0) {
      setState(() {
        _periodValueTextControler.text = ((finalValue / initialValue - 1) / (rate / 100)).toString();
      });
    } else if( initialValue != 0 && rate != 0 && period != 0 && finalValue == 0) {
      setState(() {
        _finalValueTextControler.text =
            (initialValue * (1 + (rate / 100) * period)).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juros Simples"),
      ),
      drawer: Header(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Valor inicial:"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: TextField(
                  controller: _initialValueTextControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor inicial:",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Taxa de juros:"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: TextField(
                  controller: _rateTextControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Taxa de juros:",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Periodo:"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: TextField(
                  controller: _periodValueTextControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Periodo:",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Valor final:"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: TextField(
                  controller: _finalValueTextControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor final",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: ElevatedButton(
                  child: Text("Calcular"),
                  onPressed: () {
                    calculate();
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
