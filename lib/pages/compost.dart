import 'package:finance_utilities/components/navigator.dart';
import 'package:flutter/material.dart';

class CompostPage extends StatefulWidget {
  const CompostPage({super.key});

  @override
  State<CompostPage> createState() => _CompostPageState();
}

class _CompostPageState extends State<CompostPage> {

  final TextEditingController _initialValueTextControler = TextEditingController();
  final TextEditingController _monthlyValueTextControler = TextEditingController();
  final TextEditingController _rateTextControler = TextEditingController();
  final TextEditingController _periodValueTextControler = TextEditingController();
  final TextEditingController _finalValueTextControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _initialValueTextControler.text = "0";
      _monthlyValueTextControler.text = "0";
      _rateTextControler.text = "0";
      _periodValueTextControler.text = "0";
      _finalValueTextControler.text = "0";
    });
  }

  void calculate() {
    String initialValueText = _initialValueTextControler.text;
    String monthlyValueText = _monthlyValueTextControler.text;
    String rateText = _rateTextControler.text;
    String periodText = _periodValueTextControler.text;
    String finalValueText = _finalValueTextControler.text;

    double initialValue = 0.0;
    double monthlyValue = 0.0;
    double rate = 0.0;
    double period = 0.0;
    double finalValue = 0.0;

    if (initialValueText.isEmpty) {
      initialValue = 0.0;
    } else {
      initialValue = double.parse(initialValueText);
    }

    if (monthlyValueText.isEmpty) {
      monthlyValue = 0.0;
    } else {
      monthlyValue = double.parse(monthlyValueText);
    }

    if (rateText.isEmpty) {
      rate = 0.0;
    } else {
      rate = double.parse(rateText);
    }

    if (periodText.isEmpty) {
      period = 0.0;
    } else {
      period = double.parse(periodText);
    }

    if (finalValueText.isEmpty) {
      finalValue = 0.0;
    } else {
      finalValue = double.parse(finalValueText);
    }

    if (initialValue == 0 && monthlyValue == 0 && rate == 0 && period == 0 &&
        finalValue == 0) {
      return;
    } else
    if (initialValue == 0 && monthlyValue != 0 && rate != 0 && period != 0 &&
        finalValue != 0) {
      setState(() {
        _initialValueTextControler.text =
            (finalValue / (1 + (rate / 100) * period)).toString();
      });
    } else
    if (initialValue != 0 && monthlyValue == 0 && rate != 0 && period != 0 &&
        finalValue != 0) {
      setState(() {
        _monthlyValueTextControler.text =
            (initialValue * (1 + (rate / 100) * period)).toString();
      });
    } else
    if (initialValue != 0 && monthlyValue != 0 && rate == 0 && period != 0 &&
        finalValue != 0) {
      setState(() {
        _rateTextControler.text =
            ((finalValue - initialValue) / (monthlyValue - initialValue))
                .toString();
      });
    } else
    if (initialValue != 0 && monthlyValue != 0 && rate != 0 && period == 0 &&
        finalValue != 0) {
      setState(() {
        _periodValueTextControler.text =
            ((finalValue - initialValue) / (monthlyValue - initialValue))
                .toString();
      });
    } else
    if (initialValue != 0 && monthlyValue != 0 && rate != 0 && period != 0 &&
        finalValue == 0) {
      setState(() {
        _finalValueTextControler.text =
            (monthlyValue * (1 + (rate / 100) * period)).toString();
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juros Compostos"),
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
              ),Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text("Valor Mensal:"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: TextField(
                  controller: _monthlyValueTextControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor Mensal:",
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
