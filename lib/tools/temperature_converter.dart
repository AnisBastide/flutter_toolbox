import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TemperatureConverter extends StatefulWidget {
  static const tag = "temperatureconverter";
  const TemperatureConverter({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

final TextEditingController _firstTextFieldController = TextEditingController();
final TextEditingController _secondTextFieldController = TextEditingController();

class _TemperatureConverterState extends State<TemperatureConverter> {

  final TextEditingController _firstTextFieldController = TextEditingController();
  final TextEditingController _secondTextFieldController = TextEditingController();
  String dropdownOneValue = 'C';
  String dropdownTwoValue = 'C';
  double result = 0;
  final _formKey = GlobalKey<FormState>();

  void calculate(TextEditingController inputController,
      TextEditingController resultController,String dropdownOneValue,String dropdownTwoValue) {
    if (inputController.text == "") {
      return;
    }
    double value = double.parse(inputController.text);
    if(dropdownOneValue == 'C'){
      switch (dropdownTwoValue){
        case 'C':{result = value;}
        break;
        case 'F':{result = (value * 1.8) + 32;}
        break;
        case 'K':{result = value + 273.15; }
        break;
      }
    } else if(dropdownOneValue == 'F'){
      switch (dropdownTwoValue){
        case 'F':{result = value;}
        break;
        case 'C':{result = (value - 32) / 1.8 ;}
        break;
        case 'K':{result = ((value - 32) / 1.8) + 273.15; }
        break;
      }
    }else if(dropdownOneValue == 'K'){
      switch (dropdownTwoValue){
        case 'K':{result = value;}
        break;
        case 'C':{result = (value - 273.15) ;}
        break;
        case 'F':{result = ((value - 273.15)  *1.8) +32 ; }
        break;
      }
    }

    setState(() {

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
                        calculate(_firstTextFieldController, _secondTextFieldController,dropdownOneValue,dropdownTwoValue);
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
                        calculate(_firstTextFieldController, _secondTextFieldController,dropdownOneValue,dropdownTwoValue);
                      });
                    },
                    items: <String>['C','F','K']
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
                        calculate(_secondTextFieldController, _firstTextFieldController,dropdownTwoValue,dropdownOneValue);
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
                        calculate(_secondTextFieldController, _firstTextFieldController,dropdownTwoValue,dropdownOneValue);
                      });
                    },
                    items: <String>['C','F','K']
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