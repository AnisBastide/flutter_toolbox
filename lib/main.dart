import 'package:flutter/material.dart';
import 'package:flutter_toolbox/age_calculator.dart';
import 'package:flutter_toolbox/time_spend.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coding ProjectFlutter Demo',

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: TimeSpend(),
    );
  }
}