import 'dart:math';

import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BitSizeConverter extends StatefulWidget {
  static const tag = "bitsizeconverter";

  const BitSizeConverter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BitSizeConverter> createState() => _BitSizeConverterState();
}

final TextEditingController _firstTextFieldController = TextEditingController();
final TextEditingController _secondTextFieldController = TextEditingController();

class _BitSizeConverterState extends State<BitSizeConverter> {
  String dropdownOneValue = 'O';
  String dropdownTwoValue = 'O';
  double result = 0;
  var unit = {'O': 0, 'KO': 1, 'MO': 2, 'GO': 3, 'TO': 4, 'PO': 5};
  final _formKey = GlobalKey<FormState>();

  void calculate(TextEditingController inputController,
      TextEditingController resultController) {
    int ratio = unit[dropdownOneValue]! - unit[dropdownTwoValue]!;

    setState(() {
      if (ratio < 0) {
        result = double.parse(inputController.text) / pow(1024, ratio.abs());
      } else if (ratio > 0) {
        result = double.parse(inputController.text) * pow(1024, ratio.abs());
      } else {
        result = double.parse(inputController.text);
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
                    items: <String>['O', 'KO', 'MO', 'GO', 'TO', 'PO']
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
                    items: <String>['O', 'KO', 'MO', 'GO', 'TO', 'PO']
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
