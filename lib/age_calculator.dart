import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculator createState() => _AgeCalculator();
}

class _AgeCalculator extends State<AgeCalculator> {
  static const tag = "AgeCalculator";
  DateTime birthdayDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateFormat dateFormatNext = DateFormat("yyyy-MM-dd HH:mm.ss");
  String dateOfBirth = "";
  String birthday = "";
  Duration alive= DateTime.now().difference(DateTime.now());
  int hour = 0;
  int day = 0;
  int month = 0;

  void setBirthday(DateTime date) {
    setState(() {
      dateOfBirth = dateFormat.format(date);

      birthdayDate = date;
      alive = DateTime.now().difference(birthdayDate);
      hour = alive.inHours;
      day = alive.inDays;
      month = (day*0.032855).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
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
                    style: TextStyle(color: Colors.cyanAccent),
                  )
                ),
                Text("Date of birth : "+dateOfBirth.toString()),
                Text("total months lived: "+month.toString()),
                Text("total days lived: "+day.toString()),
                Text("total hours lived: "+hour.toString())
              ],
          ),
      ),
    );
  }
}