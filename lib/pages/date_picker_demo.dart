import 'package:flutter/material.dart';

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime pickedDate = DateTime.now();

  bool _excludeWeekends(DateTime day) {
    if (day.weekday == DateTime.saturday || day.weekday == DateTime.sunday) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Default Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pickedDate.toIso8601String().split('T')[0],
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final DateTime picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2022, 12, 31),
                  locale: Locale('ko', 'KR'),
                  initialEntryMode: DatePickerEntryMode.calendar,
                  initialDatePickerMode: DatePickerMode.day,
                  selectableDayPredicate: _excludeWeekends,
                  helpText: '예약일자를 선택하세요',
                  confirmText: '예약',
                  fieldLabelText: '예약 일자',
                  fieldHintText: '연. 월. 일.',
                  errorFormatText: '연. 월. 일. 형태로 입력하세요',
                  errorInvalidText: '범위 내의 날짜를 입력하세요',
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.dark(),
                      child: child,
                    );
                  },
                );
                if (picked != null && picked != pickedDate) {
                  setState(() {
                    pickedDate = picked;
                  });
                }
              },
              child: Text(
                'Pick Date',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
