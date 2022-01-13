import 'package:flutter/material.dart';
import 'package:flutter_toolbox/tools/age_calculator.dart';
import 'package:flutter_toolbox/tools/area_converter.dart';
import 'package:flutter_toolbox/tools/size_converter.dart';
import 'package:flutter_toolbox/tools/date_delay_calculator.dart';
import 'package:flutter_toolbox/tools/distance_calculator.dart';
import 'package:flutter_toolbox/tools/numerical_converter.dart';
import 'package:flutter_toolbox/tools/redeem_calculator.dart';
import 'package:flutter_toolbox/tools/roman_numerical_converter.dart';
import 'package:flutter_toolbox/tools/temperature_converter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AgeCalculator.tag);
                  },
                  child: Stack(
                    children: const [
                      Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1123561499342118912/01VmJUl5_400x400.png"),
                      ),
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
                      Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1123561499342118912/01VmJUl5_400x400.png"),
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
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1123561499342118912/01VmJUl5_400x400.png"),
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
                    Navigator.of(context).pushNamed(DateDelayCalculator.tag);
                  },
                  child: Stack(
                    children: const [
                      Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1123561499342118912/01VmJUl5_400x400.png"),
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
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1123561499342118912/01VmJUl5_400x400.png"),
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
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1123561499342118912/01VmJUl5_400x400.png"),
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
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1123561499342118912/01VmJUl5_400x400.png"),
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
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1123561499342118912/01VmJUl5_400x400.png"),
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
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1123561499342118912/01VmJUl5_400x400.png"),
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
