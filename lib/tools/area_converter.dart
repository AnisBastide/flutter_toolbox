import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AreaCalculator extends StatefulWidget {
  static const tag = "areacalculator";

  const AreaCalculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AreaCalculator> createState() => _AreaCalculatorState();
}

final TextEditingController _firstTextFieldController = TextEditingController();
final TextEditingController _secondTextFieldController = TextEditingController();

class _AreaCalculatorState extends State<AreaCalculator> {
  String dropdownOneValue = 'm2';
  String dropdownTwoValue = 'm2';
  double result = 0;
  var powUnit = {'cm2':-5,'m2':0,'km2':6, 'h':5, 'ac':0};
  var unit = {'cm2':1,'m2':1,'km2':1, 'h':1, 'ac':4046};
  final _formKey = GlobalKey<FormState>();

  void calculate(TextEditingController inputController, String dropDownInputValue,
      TextEditingController resultController, String dropDownSecondValue) {
    if (inputController.text == "") {
      resultController.text = "X";
    } else {
      num powRatio = powUnit[dropDownInputValue]! - powUnit[dropDownSecondValue]!;
      num ratio = unit[dropDownSecondValue]! * unit[dropDownInputValue]!;
      print(powRatio);
      print(ratio);

      setState(() {
        if (powRatio == 0) {
          result = double.parse(inputController.text) * ratio;
        } else {
          result =
              double.parse(inputController.text) * ratio * pow(10, powRatio);
        }
        resultController.text = result.toString();
      });
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
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    //
                    onChanged: (String? newValue) {
                      setState(() {
                        calculate(_firstTextFieldController, dropdownOneValue, _secondTextFieldController, dropdownTwoValue);
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
                        calculate(_firstTextFieldController, dropdownOneValue, _secondTextFieldController, dropdownTwoValue);
                      });
                    },
                    items: <String>['cm2', 'm2', 'km2', 'h', 'ac']
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
                        calculate(_secondTextFieldController, dropdownTwoValue, _firstTextFieldController, dropdownOneValue);
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
                        calculate(_secondTextFieldController, dropdownTwoValue, _firstTextFieldController, dropdownOneValue);
                      });
                    },
                    items: <String>['cm2', 'm2', 'km2', 'h', 'ac']
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
