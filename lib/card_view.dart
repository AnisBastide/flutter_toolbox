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

class CardPage extends StatefulWidget {
  @override
  _CardPage createState() => _CardPage();
}

class _CardPage extends State<CardPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Toolbox"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(80),
            sliver: SliverGrid.count(
              crossAxisSpacing: 80,
              mainAxisSpacing: 80,
              crossAxisCount: 4,
              children: <Widget>[
                Card(

                ),
                Card(

                ),
                Card(

                ),
                Card(

                ),
                Card(

                ),
                Card(

                ),
                Card(

                ),
                Card(

                ),
                Card(

                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(BitSizeConverter.tag);
                  },
                  child: Stack(
                    children: const [
                      Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "bit.jpeg"),
                      ),
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
                      Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "promotions.jpg"),
                      ),
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
                      Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "chrono.png"),
                      ),
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
                      Image(
                        fit: BoxFit.fill,
                        image:AssetImage(
                            "distance.jpg"),
                      ),
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
                      Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "numerical.jpg"),
                      ),
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
                      Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "area.png"),
                      ),
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
                      Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "temperature.jpg"),
                      ),
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
                      Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "roman.jpg"),
                      ),
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
          ),
        ],
      ),
    );
  }
}
