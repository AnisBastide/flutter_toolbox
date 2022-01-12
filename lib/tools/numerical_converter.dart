import 'package:flutter/material.dart';

class NumericalConverter extends StatefulWidget {
  static const tag = "numericalconverter";

  @override
  _NumericalConverterState createState() => _NumericalConverterState();
}

class _NumericalConverterState extends State<NumericalConverter> {
  int index = 0;
  String dropdownOneValue = 'O';
  String dropdownTwoValue = 'O';
  String textValue = "";
  var unit = {'O': 0, 'KO': 1, 'MO': 2, 'GO': 3, 'TO': 4, 'PO': 5};

  final _formKey = GlobalKey<FormState>();

  void Function() calculate() {
    return () {
      print(dropdownOneValue + dropdownTwoValue + textValue);
    };
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
        title: Text("Numerical content"),
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
                    onChanged: (String? newValue) {
                      setState(() {
                        textValue = newValue!;
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
                  TextButton(onPressed: calculate(), child: Text('Convert!'))
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
