import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RomanNumericalConverter extends StatefulWidget {
  static const tag = "romannumericalconverter";

  const RomanNumericalConverter({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _RomanNumericalConverterState createState() => _RomanNumericalConverterState();
}

class _RomanNumericalConverterState extends State<RomanNumericalConverter> {
  String textValue="";
  String resultValue="";
  final _formKey = GlobalKey<FormState>();
  void calculate(){
    int value = int.parse(textValue);
    String displayValue = "None";
    if (value > 3999) {
      displayValue = "Value > 3999 will be available later";
      setState(() {
        resultValue = displayValue;
      });
      return;
    }

    displayValue = "";
    int mValue = value ~/ 1000;
    int cValue = value % 1000 ~/ 100;
    int dValue = value % 100 ~/ 10;
    int uValue = value % 10;
    while (mValue > 0) {
      displayValue = displayValue + "M";
      mValue--;
    }

    if (cValue != 0) {
      if (cValue == 9) {
        displayValue = displayValue + "CM";
      } else if (cValue > 5) {
        displayValue = displayValue + "D";
        while (cValue > 5) {
          displayValue = displayValue + "C";
          cValue--;
        }
      } else if (cValue == 5) {
        displayValue = displayValue + "D";
      } else if (cValue == 4) {
        displayValue = displayValue + "DC";
      } else {
        while (cValue > 0) {
          displayValue = displayValue + "C";
          cValue--;
        }
      }
    }

    if (dValue != 0) {
      if (dValue == 9) {
        displayValue = displayValue + "XC";
      } else if (dValue > 5) {
        displayValue = displayValue + "L";
        while (dValue > 5) {
          displayValue = displayValue + "X";
          dValue--;
        }
      } else if (dValue == 5) {
        displayValue = displayValue + "L";
      } else if (dValue == 4) {
        displayValue = displayValue + "XL";
      } else {
        while (dValue > 0) {
          displayValue = displayValue + "X";
          dValue--;
        }
      }
    }

    if (uValue != 0) {
      if (uValue == 9) {
        displayValue = displayValue + "IX";
      } else if (uValue > 5) {
        displayValue = displayValue + "V";
        while (uValue > 5) {
          displayValue = displayValue + "I";
          uValue--;
        }
      } else if (uValue == 5) {
        displayValue = displayValue + "V";
      } else if (uValue == 4) {
        displayValue = displayValue + "IV";
      } else {
        while (uValue > 0) {
          displayValue = displayValue + "I";
          uValue--;
        }
      }
    }

    print(displayValue);
    setState(() {
      resultValue = displayValue;
    });
  }
  @override
  Widget build(BuildContext context) {
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
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], //
                    onChanged: (String? newValue) {
                      setState(() {
                        textValue = newValue!;
                      });},
                    validator: (value){
                      if (value ==null || value.isEmpty){
                        return 'Please enter some text';
                      }

                      return null;
                    },
                  ),
                  TextButton(
                      onPressed:() {
                        calculate();
                      },
                      child: const Text(
                          'Convert!'
                      )),
                  Text(resultValue)
                ],
              ),
            )],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
