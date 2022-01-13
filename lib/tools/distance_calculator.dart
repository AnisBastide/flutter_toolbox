import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DistanceCalculator extends StatefulWidget {
  static const tag = "distancecalculator";

  const DistanceCalculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DistanceCalculator> createState() => _DistanceCalculatorState();
}

final TextEditingController _firstTextFieldController = TextEditingController();
final TextEditingController _secondTextFieldController = TextEditingController();

class _DistanceCalculatorState extends State<DistanceCalculator> {
  String dropdownOneValue = 'm';
  String dropdownTwoValue = 'm';
  double result = 0;
  var unit = {'nm':-9,'mm':-3,'cm':-2, 'dm':-1, 'm':0, 'km':3, 'yd':1.09361, 'ft':3.28083,'in':39.3701};
  final _formKey = GlobalKey<FormState>();

  void calculate(TextEditingController inputController,
      TextEditingController resultController) {
    num ratio = unit[dropdownOneValue]! + unit[dropdownTwoValue]!;

    setState(() {
      if (ratio == 0) {
        result = double.parse(inputController.text);
      } else {
        result = double.parse(inputController.text) * pow(10, ratio);
      }
      resultController.text = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstTextFieldController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    //
                    onChanged: (String? newValue) {
                      setState(() {
                        calculate(_firstTextFieldController, _secondTextFieldController);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                  ),
                  DropdownButton<String>(
                    value: dropdownOneValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownOneValue = newValue!;
                        calculate(_firstTextFieldController, _secondTextFieldController);
                      });
                    },
                    items: <String>['nm','mm','cm', 'dm', 'm', 'km', 'yd', 'ft','in']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextFormField(
                    controller: _secondTextFieldController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    //
                    onChanged: (String? newValue) {
                      setState(() {
                        calculate(_secondTextFieldController, _firstTextFieldController);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  DropdownButton<String>(
                    value: dropdownTwoValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownTwoValue = newValue!;
                        calculate(_secondTextFieldController, _firstTextFieldController);
                      });
                    },
                    items: <String>['nm','mm','cm', 'dm', 'm', 'km', 'yd', 'ft','in']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
