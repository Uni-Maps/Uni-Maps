import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:winhacks/models/models.dart';

class CalenderPage extends StatefulWidget {
  final Function toggleView;
  CalenderPage({this.toggleView});

  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String title = 'Calendar';

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    // Background Image
                    image: AssetImage("assets/images/blank_background.png"),
                    fit: BoxFit.fill)),
          ),
        ),
        Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            topAppBarEmpty(title, screenWidth),
            TableCalendar(
              // Calendar colours
              calendarStyle: CalendarStyle(
                  cellPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  defaultTextStyle: TextStyle(color: Colors.white),
                  disabledTextStyle: TextStyle(color: Colors.white24),
                  weekendTextStyle: TextStyle(color: Colors.white),
                  todayTextStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              // Header formatting
              headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              // Calendar colours for dates
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.white),
                  weekendStyle: TextStyle(color: Colors.white)),
              // Padding
              firstDay: DateTime.utc(2010, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
            ),
          ],
        ))
      ],
    ));
  }
}
