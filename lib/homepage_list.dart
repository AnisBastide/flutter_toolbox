import 'package:flutter/material.dart';
import 'package:flutter_toolbox/tools/age_calculator.dart';
import 'package:flutter_toolbox/tools/area_converter.dart';
import 'package:flutter_toolbox/tools/size_converter.dart';
import 'package:flutter_toolbox/tools/distance_calculator.dart';
import 'package:flutter_toolbox/tools/numerical_converter.dart';
import 'package:flutter_toolbox/tools/redeem_calculator.dart';
import 'package:flutter_toolbox/tools/roman_numerical_converter.dart';
import 'package:flutter_toolbox/tools/temperature_converter.dart';
import 'package:flutter_toolbox/tools/time_spend.dart';

import 'homepage.dart';

class HomePageList extends StatefulWidget {
  static const tag = "homepagelist";

  @override
  _HomePageListState createState() => _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Toolbox"),
          centerTitle: true,
        ),
        body: ListView(
          primary: false,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AgeCalculator.tag);
              },
              child: Stack(
                children: const [
                  Center(
                      child: Text(
                    "Age calculator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.lightBlue),
                  ))
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(BitSizeConverter.tag);
              },
              child: Stack(
                children: const [
                  Center(
                      child: Text(
                    "Bit size converter",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.lightBlue),
                  ))
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RedeemCalculator.tag);
              },
              child: Stack(
                children: const [
                  Center(
                      child: Text(
                    "Redeem calculator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.lightBlue),
                  ))
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(TimeSpend.tag);
              },
              child: Stack(
                children: const [
                  Center(
                      child: Text(
                    "Date delay calculator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.lightBlue),
                  ))
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(DistanceCalculator.tag);
              },
              child: Stack(
                children: const [
                  Center(
                      child: Text(
                    "Distance calculator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.lightBlue),
                  ))
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NumericalConverter.tag);
              },
              child: Stack(
                children: const [
                  Center(
                      child: Text(
                    "Numerical converter",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.lightBlue),
                  ))
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AreaCalculator.tag);
              },
              child: Stack(
                children: const [
                  Center(
                      child: Text(
                    "Area converter",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.lightBlue),
                  ))
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(TemperatureConverter.tag);
              },
              child: Stack(
                children: const [
                  Center(
                      child: Text(
                    "Temperature converter",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.lightBlue),
                  ))
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RomanNumericalConverter.tag);
              },
              child: Stack(
                children: const [
                  Center(
                      child: Text(
                    "Roman numerical converter",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.lightBlue),
                  ))
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(child: Text('Grid Menu')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  child: Text("Grid")),
              TextButton(onPressed: null, child: Text("Card view"))
            ],
          ),
        ));
  }
}
