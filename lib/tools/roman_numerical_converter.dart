import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RomanNumericalConverter extends StatefulWidget {
  static const tag = "romannumericalconverter";

  const RomanNumericalConverter({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  _RomanNumericalConverterState createState() =>
      _RomanNumericalConverterState();
}

final TextEditingController _firstTextFieldController = TextEditingController();
final TextEditingController _secondTextFieldController =
    TextEditingController();

class _RomanNumericalConverterState extends State<RomanNumericalConverter> {
  String arabTextValue = "";
  String romanTextValue = "";
  String resultValue = "";
  final _formKey = GlobalKey<FormState>();

  void arabToRom() {
    String displayValue;
    if (arabTextValue == "") {
      displayValue = "None";
    } else {
      int value = int.parse(arabTextValue);
      if (value > 3999) {
        displayValue = "Value > 3999 will be available later";
      } else {
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
      }
    }
    print(displayValue);
    setState(() {
      _secondTextFieldController.text = displayValue;
    });
  }

  void romToArab() {
    int value = 0;
    String romanText = romanTextValue;
    String displayValue;
    if (romanText == "") {
      displayValue = "None";
    } else {
      if (romanText.startsWith("M")) {
        if (romanText.startsWith("MMM")) {
          value += 3000;
          romanText = romanText.replaceFirst("MMM", "");
        } else if (romanText.startsWith("MM")) {
          value += 2000;
          romanText = romanText.replaceFirst("MM", "");
        } else if (romanText.startsWith("M")) {
          value += 1000;
          romanText = romanText.replaceFirst("M", "");
        }
      }

      if (romanText.startsWith("C")) {
        if (romanText.startsWith("CM")) {
          value += 900;
          romanText = romanText.replaceFirst("CM", "");
        } else if (romanText.startsWith("CD")) {
          value += 400;
          romanText = romanText.replaceFirst("CD", "");
        } else if (romanText.startsWith("CCC")) {
          value += 300;
          romanText = romanText.replaceFirst("CCC", "");
        } else if (romanText.startsWith("CC")) {
          value += 200;
          romanText = romanText.replaceFirst("CC", "");
        } else if (romanText.startsWith("C")) {
          value += 100;
          romanText = romanText.replaceFirst("C", "");
        }
      } else if (romanText.startsWith("D")) {
        if (romanText.startsWith("DCCC")) {
          value += 800;
          romanText = romanText.replaceFirst("DCCC", "");
        } else if (romanText.startsWith("DCC")) {
          value += 700;
          romanText = romanText.replaceFirst("DCC", "");
        } else if (romanText.startsWith("DC")) {
          value += 600;
          romanText = romanText.replaceFirst("DC", "");
        } else {
          value += 500;
          romanText = romanText.replaceFirst("D", "");
        }
      }

        if (romanText.startsWith("X")) {
          if (romanText.startsWith("XL")) {
            value += 40;
            romanText = romanText.replaceFirst("XL", "");
          } else if (romanText.startsWith("XXX")) {
            value += 30;
            romanText = romanText.replaceFirst("XXX", "");
          } else if (romanText.startsWith("XX")) {
            value += 20;
            romanText = romanText.replaceFirst("XX", "");
          } else if (romanText.startsWith("X")) {
            value += 10;
            romanText = romanText.replaceFirst("X", "");
          }
        } else if (romanText.startsWith("L")) {
          if (romanText.startsWith("LXXX")) {
            value += 80;
            romanText = romanText.replaceFirst("LXXX", "");
          } else if (romanText.startsWith("LXX")) {
            value += 70;
            romanText = romanText.replaceFirst("LXX", "");
          } else if (romanText.startsWith("LX")) {
            value += 60;
            romanText = romanText.replaceFirst("LX", "");
          } else {
            value += 50;
            romanText = romanText.replaceFirst("L", "");
          }
        }

          if (romanText.startsWith("I")) {
            if (romanText.startsWith("IV")) {
              value += 4;
              romanText = romanText.replaceFirst("IV", "");
            } else if (romanText.startsWith("III")) {
              value += 3;
              romanText = romanText.replaceFirst("III", "");
            } else if (romanText.startsWith("II")) {
              value += 2;
              romanText = romanText.replaceFirst("II", "");
            } else if (romanText.startsWith("I")) {
              value += 1;
              romanText = romanText.replaceFirst("I", "");
            }
          } else if (romanText.startsWith("V")) {
            if (romanText.startsWith("vIII")) {
              value += 8;
              romanText = romanText.replaceFirst("VIII", "");
            } else if (romanText.startsWith("VII")) {
              value += 7;
              romanText = romanText.replaceFirst("VII", "");
            } else if (romanText.startsWith("VI")) {
              value += 6;
              romanText = romanText.replaceFirst("VI", "");
            } else {
              value += 5;
              romanText = romanText.replaceFirst("V", "");
            }
          }
      displayValue = value.toString();
    }

    print(romanText);

    if (romanText != "") {
      displayValue = "Invalid";
    }

    print(displayValue);
    setState(() {
      _firstTextFieldController.text = displayValue;
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
                    controller: _firstTextFieldController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    //
                    onChanged: (String? newValue) {
                      arabTextValue = newValue!;
                      arabToRom();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _secondTextFieldController,
                    keyboardType: TextInputType.text,
                    onChanged: (String? newValue) {
                      romanTextValue = newValue!;
                      romToArab();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
