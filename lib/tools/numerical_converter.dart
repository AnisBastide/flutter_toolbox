import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericalConverter extends StatefulWidget {
  static const tag = "numericalconverter";

  const NumericalConverter({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _NumericalConverterState createState() => _NumericalConverterState();
}

final TextEditingController _firstTextFieldController = TextEditingController();
final TextEditingController _secondTextFieldController =
    TextEditingController();

class _NumericalConverterState extends State<NumericalConverter> {
  String convertTypeOne = 'choose';
  String convertTypeTwo = 'choose';
  double result = 0;
  final _formKey = GlobalKey<FormState>();

  num decToBin(num value) {
    String result = "";
    while (value > 0) {
      if (value % 2 != 0) {
        result = "1" + result;
      } else {
        result = "0" + result;
      }
      value = value ~/ 2;
    }

    while (result.length % 4 != 0) {
      result = "0" + result;
    }
    return num.parse(result);
  }

  num binToDec(num value) {
    num result = 0;
    String text = value.toString();
    int index = text.length - 1;
    num power = 0;
    while (index >= 0) {
      result += num.parse(text[index]) * pow(2, power);
      power++;
      index--;
    }
    return result;
  }

  num binToOctal(num value) {
    num result = 0;
    String text = value.toString();
    String triStr = "";
    while (text.length % 3 != 0) {
      text = "0" + text;
    }

    int index = text.length - 1;
    int loop = 0;
    while (index >= 2) {
      triStr = text[index - 2] + text[index - 1] + text[index];
      index = index - 3;
      int triIndex = 0;
      num triVal = 0;
      while (triIndex <= 2) {
        num indexVal = num.parse(triStr[triIndex]);
        if (triIndex == 0) {
          triVal += 4 * indexVal;
        } else if (triIndex == 1) {
          triVal += 2 * indexVal;
        } else if (triIndex == 2) {
          triVal += indexVal;
        }
        triIndex++;
      }
      result = result + triVal * pow(10, loop);
      loop++;
    }
    return result;
  }

  num octalToDec(num value) {
    num result = 0;
    String text = value.toString();

    int index = text.length - 1;
    num loop = 0;
    while (index >= 0) {
      num digit = num.parse(text[index]);
      result = result + digit * pow(10, loop);
      loop++;
      index--;
    }
    return result;
  }

  String binToHex(num value) {
    String result = "";
    var digits = {10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"};

    String text = value.toString();
    String quadStr = "";
    while (text.length % 4 != 0) {
      text = "0" + text;
    }

    int index = 3;
    while (index < text.length) {
      quadStr =
          text[index - 3] + text[index - 2] + text[index - 1] + text[index];
      index = index + 4;
      num quadDec = binToDec(num.parse(quadStr));
      if (digits.containsKey(quadDec)) {
        result = result + digits[quadDec]!;
      } else {
        result = result + quadDec.toString();
      }
    }
    return result;
  }

  num hexToBin(String value) {
    var digits = {
      "0": "0000",
      "1": "0001",
      "2": "0010",
      "3": "0011",
      "4": "0100",
      "5": "0101",
      "6": "0110",
      "7": "0111",
      "8": "1000",
      "9": "1001",
      "A": "1010",
      "B": "1011",
      "C": "1100",
      "D": "1101",
      "E": "1110",
      "F": "1111"
    };

    String textResult = "";

    int index = 0;
    while (index < value.length) {
      textResult = textResult + digits[value[index]]!;
      index++;
    }
    return num.parse(textResult);
  }

  void calculate(
      TextEditingController inputController,
      String dropDownInputValue,
      String dropDownOutputValue,
      TextEditingController resultController) {
    if (inputController.text.isNotEmpty) {
      if (dropDownInputValue != "choose" &&
          dropDownOutputValue != "choose" &&
          dropDownInputValue != dropDownOutputValue) {
        num value = 0;
        String result = inputController.text;
        if (dropDownInputValue == "binary") {
          value = num.parse(result);
          print("From BIN");
        } else if (dropDownInputValue == "decimal") {
          print("From DEC");
          value = decToBin(num.parse(inputController.text));
        } else if (dropDownInputValue == "octal") {
          print("From OCT");
          value = octalToDec(num.parse(result));
          value = decToBin(value);
        } else if (dropDownInputValue == "hexadecimal") {
          print("From HEX");
          value = hexToBin(result);
        }
        if (dropDownOutputValue == "binary") {
          print("TO BIN");
          result = value.toString();
        } else if (dropDownOutputValue == "decimal") {
          print("TO DEC");
          value = binToDec(value);
          result = value.toString();
        } else if (dropDownOutputValue == "octal") {
          print("TO OCT");
          value = binToOctal(value);
          result = value.toString();
        } else if (dropDownOutputValue == "hexadecimal") {
          print("TO HEX");
          result = binToHex(value);
        }
        setState(() {
          resultController.text = result;
        });
      }
    }
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
                    //
                    onChanged: (String? newValue) {
                      setState(() {
                        calculate(_firstTextFieldController, convertTypeOne,
                            convertTypeTwo, _secondTextFieldController);
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
                    value: convertTypeOne,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        convertTypeOne = newValue!;
                      });
                    },
                    items: <String>[
                      'choose',
                      'decimal',
                      'binary',
                      'octal',
                      'hexadecimal'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: convertTypeTwo,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        convertTypeTwo = newValue!;
                      });
                    },
                    items: <String>[
                      'choose',
                      'decimal',
                      'binary',
                      'octal',
                      'hexadecimal'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextFormField(
                    controller: _secondTextFieldController,
                    //
                    onChanged: (String? newValue) {
                      setState(() {
                        calculate(_secondTextFieldController, convertTypeTwo,
                            convertTypeOne, _firstTextFieldController);
                      });
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
