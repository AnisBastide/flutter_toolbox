import 'package:flutter/material.dart';

class Distance_Calculator extends StatefulWidget {
  static const tag = "distancecalculator";
  @override
  _Distance_CalculatorState createState() => _Distance_CalculatorState();
}

class _Distance_CalculatorState extends State<Distance_Calculator> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Distance calculator"),
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
                    //Navigator.of(context).pushNamed(SecondPage.tag);
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
                    //Navigator.of(context).pushNamed(SecondPage.tag);
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
                    //Navigator.of(context).pushNamed(SecondPage.tag);
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
                    //Navigator.of(context).pushNamed(SecondPage.tag);
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
                    //Navigator.of(context).pushNamed(SecondPage.tag);
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
                    //Navigator.of(context).pushNamed(SecondPage.tag);
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
                    //Navigator.of(context).pushNamed(SecondPage.tag);
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
                    //Navigator.of(context).pushNamed(SecondPage.tag);
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
