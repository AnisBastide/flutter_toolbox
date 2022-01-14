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
import 'homepage_list.dart';

class HomePageCard extends StatefulWidget {
  static const tag = "homepagecard";

  @override
  _CardPage createState() => _CardPage();
}

class _CardPage extends State<HomePageCard> {
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
            SliverToBoxAdapter(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(AgeCalculator.tag),
                    child: Container(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/age.jpg"),
                              height: 150,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Age Calculator"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(BitSizeConverter.tag),
                    child: Container(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/bit.jpeg"),
                              height: 150,
                            ),
                            Row(
                              children: [
                                Text("Bit size converter"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(RedeemCalculator.tag),
                    child: Container(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/promotions.jpg"),
                              height: 150,
                            ),
                            Row(
                              children: [
                                Text("Redeem calculator"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(TimeSpend.tag),
                    child: Container(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/chrono.png"),
                              height: 150,
                            ),
                            Row(
                              children: [
                                Text("Date delay calculator"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(DistanceCalculator.tag),
                    child: Container(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/distance.jpg"),
                              height: 150,
                            ),
                            Row(
                              children: [
                                Text("Distance calculator"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(NumericalConverter.tag),
                    child: Container(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/numerical.jpg"),
                              height: 150,
                            ),
                            Row(
                              children: [
                                Text("Numerical converter"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(AreaCalculator.tag),
                    child: Container(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/area.png"),
                              height: 150,
                            ),
                            Row(
                              children: [
                                Text("Area converter"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(TemperatureConverter.tag),
                    child: Container(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/temperature.jpg"),
                              height: 150,
                            ),
                            Row(
                              children: [
                                Text("Temperature converter"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(RomanNumericalConverter.tag),
                    child: Container(
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage("assets/roman.jpg"),
                              height: 150,
                            ),
                            Row(
                              children: [
                                Text("Roman numerical converter"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                  child: Text("Grid view")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePageList.tag);
                  },
                  child: Text("List view"))
            ],
          ),
        ));
  }
}
