import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AgeCalculator extends StatefulWidget {
  static const tag = "AgeCalculator";
  const AgeCalculator({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _AgeCalculator createState() => _AgeCalculator();
}

class _AgeCalculator extends State<AgeCalculator> {
  DateTime today = DateTime.now();
  DateFormat dateFormatBirthday = DateFormat("yyyy-MM-dd HH:mm.ss");
  int nextBirthday = 0;
  DateTime dateOfBirth = DateTime.now();
  String birthday = "";
  int alive= 0;
  double hour = 0;
  double day = 0;
  double month = 0;

  int calculNextBirthday(DateTime date){
    DateTime now = DateTime.now(); // 2022-01-13 00:00:00
    String year = now.year.toString(); // 2022
    String birthYear = date.year.toString(); // 2000
    String nextBirth = dateFormatBirthday.format(date); // 2000-01-01 00:00:00

    nextBirth = nextBirth.replaceAll(birthYear, year); // 2022-01-01 00:00:00
    DateTime next = new DateFormat("yyyy-MM-dd HH:mm.ss").parse(nextBirth);
    Duration calcul = next.difference(now);

    if (calcul.inDays < 0){
      year = (int.parse(year)+1).toString(); // 2023
      nextBirth = nextBirth.replaceAll(birthYear, year); // 2023-01-01 00:00:00
      Duration calcul = now.difference(next);
      return calcul.inDays + 1;
    }else{
      return calcul.inDays + 1;
    }
  }

  void setBirthday(DateTime date) {
    setState(() {
      nextBirthday = calculNextBirthday(date);
      today = date;
      dateOfBirth = date;
      alive = DateTime.now().difference(dateOfBirth).inHours;
      hour = double.parse(alive.toString());
      day = alive / 24;
      month = alive / 730;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1900, 1, 1),
                    maxTime: DateTime.now(),
                    onChanged: (date) {},
                    onConfirm: (date) {setBirthday(date);},
                    currentTime: DateTime.now(),
                    locale: LocaleType.en);
                  },
                  child: Text(
                    "Select Birthday",
                    style: TextStyle(color: Colors.blue),
                  )
                ),
                Text("Date of birth : "+dateOfBirth.toString()),
                Text("Next birthday in "+nextBirthday.toString()+" days"),
                Text("total months lived: "+month.toString()),
                Text("total days lived: "+day.toString()),
                Text("total hours lived: "+hour.toString())
              ],
          ),
      ),
    );
  }
}