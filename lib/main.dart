import 'package:flutter/material.dart';
import 'package:flutter_toolbox/tools/age_calculator.dart';
import 'package:flutter_toolbox/tools/area_converter.dart';
import 'package:flutter_toolbox/tools/distance_calculator.dart';
import 'package:flutter_toolbox/tools/numerical_converter.dart';
import 'package:flutter_toolbox/tools/redeem_calculator.dart';
import 'package:flutter_toolbox/tools/roman_numerical_converter.dart';
import 'package:flutter_toolbox/tools/size_converter.dart';
import 'package:flutter_toolbox/tools/temperature_converter.dart';
import 'homepage.dart';
import 'package:flutter_toolbox/tools/time_spend.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AgeCalculator.tag:(context)=>AgeCalculator(title: "Age calculator"),
        TimeSpend.tag:(context)=>TimeSpend(title: "Time spend"),
        AreaCalculator.tag:(context)=>const AreaCalculator(title: "Area converter"),
        BitSizeConverter.tag:(context)=>const BitSizeConverter(title: "Bit size converter"),
        DistanceCalculator.tag:(context)=>const DistanceCalculator(title: "Distance Calculator"),
        NumericalConverter.tag:(context)=>NumericalConverter(),
        RedeemCalculator.tag:(context)=>const RedeemCalculator(title:"Redeem calculator"),
        RomanNumericalConverter.tag:(context)=>const RomanNumericalConverter(title: "Roman number converter",),
        TemperatureConverter.tag:(context)=>TemperatureConverter(title:'temperature converter'),
      },
      debugShowCheckedModeBanner: true,
      title: 'Coding ProjectFlutter Demo',

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}