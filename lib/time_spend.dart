import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class TimeSpend extends StatefulWidget {
  @override
  _TimeSpend createState() => _TimeSpend();
}

class _TimeSpend extends State<TimeSpend> {
  static const tag = "TimeSpend";
  DateTime firstDate = DateTime.now();
  DateTime secondDate = DateTime.now();
  int time= 0;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  void setDate1(DateTime date){
    setState(() {
      firstDate = date;
    });
  }

  void setDate2(DateTime date){
    setState(() {
      secondDate = date;
    });
  }

  void setDate() {
    setState(() {
      time = secondDate.difference(firstDate).inDays;
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
                      minTime: DateTime(0, 1, 1),
                      maxTime: secondDate,
                      onChanged: (date) {},
                      onConfirm: (date) {setDate1(date); setDate();},
                      currentTime: DateTime.now(),
                      locale: LocaleType.en);
                },
                child: Text(
                  "Select First Date",
                  style: TextStyle(color: Colors.cyanAccent),
                )
            ),
            TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: firstDate,
                      onChanged: (date) {},
                      onConfirm: (date) {setDate2(date); setDate();},
                      currentTime: DateTime.now(),
                      locale: LocaleType.en);
                },
                child: Text(
                  "Select Second Date",
                  style: TextStyle(color: Colors.cyanAccent),
                )
            ),
            Text("Date : " + time.toString()),

          ],
        ),
      ),
    );
  }
}