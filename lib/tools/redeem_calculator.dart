import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RedeemCalculator extends StatefulWidget {
  static const tag = "redeemcalculator";

  const RedeemCalculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RedeemCalculatorState createState() => _RedeemCalculatorState();
}

final TextEditingController _firstTextFieldController = TextEditingController();
final TextEditingController _secondTextFieldController =
    TextEditingController();

class _RedeemCalculatorState extends State<RedeemCalculator> {
  double discount = 0;
  double finalPrice = 0;
  final _formKey = GlobalKey<FormState>();

  void calculate() {
    if (_firstTextFieldController.text == '' ||
        _secondTextFieldController.text == '') {
      return;
    }
    setState(() {
      discount = double.parse(_firstTextFieldController.text) *
          (double.parse(_secondTextFieldController.text) / 100);
      finalPrice = double.parse(_firstTextFieldController.text) - discount;
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _firstTextFieldController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }

                            return null;
                          },
                        ),
                      ),
                      const Text('euro')
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _secondTextFieldController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    const Text('%')],
                  ),
                  TextButton(
                      onPressed: () {
                        calculate();
                      },
                      child: const Text('Calculer')),
                  const Text('La reduction est de:'),
                  Text(discount.toString() + ' euro'),
                  const Text('Le prix final est de:'),
                  Text(finalPrice.toString() + ' euro')
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
