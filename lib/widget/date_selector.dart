import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_toolbox/age_calculator.dart';

class DateSelector{
  DateTime finalDate = DateTime.now();

  Widget dateSelector(BuildContext context, DateTime firstDate, DateTime lastDate, String text, Color textColor ) {
    return TextButton(
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: firstDate,
              maxTime: lastDate,
              onChanged: (date) {},
              onConfirm: (date) {
                },
              currentTime: DateTime.now(),
              locale: LocaleType.en);
        },
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ));
  }
}
