import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:gw/globals.dart' as globals;

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class MonthlyWork extends StatefulWidget {
  const MonthlyWork({Key? key}) : super(key: key);

  @override
  State<MonthlyWork> createState() => _MonthlyWorkState();
}

class _MonthlyWorkState extends State<MonthlyWork> {
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50.0), // AppBar 사이즈 지정
      //   child: AppBar(
      //     backgroundColor: Colors.white, // AppBar 색상 지정

      //     leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Icon(Icons.arrow_back_ios_rounded),
      //     ),

      //     iconTheme: IconThemeData(color: Color.fromARGB(255, 32, 32, 32)),
      //     elevation: 0.0,

      //     centerTitle: true,
      //   ),
      // ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 23.0),
        child: CalendarCarousel<Event>(
          onDayPressed: (DateTime date, List<Event> events) {
            this.setState(() => _currentDate = date);
          },
          thisMonthDayBorderColor: Colors.transparent,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
          // customDayBuilder: (
          //   /// you can provide your own build function to make custom day containers
          //   bool isSelectable,
          //   int index,
          //   bool isSelectedDay,
          //   bool isToday,
          //   bool isPrevMonthDay,
          //   TextStyle textStyle,
          //   bool isNextMonthDay,
          //   bool isThisMonthDay,
          //   DateTime day,
          // ) {
          //   /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
          //   /// This way you can build custom containers for specific days only, leaving rest as default.

          //   // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
          //   if (day.day == 15) {
          //     return Center(
          //       child: Icon(Icons.local_airport),
          //     );
          //   } else {
          //     return null;
          //   }
          // },
          headerTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'rouf-font',
            fontSize: 20.0,
          ),
          iconColor: Colors.black,
          weekdayTextStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
          weekendTextStyle: TextStyle(fontSize: 15.0, color: Colors.black),
          todayTextStyle: TextStyle(fontSize: 15.0, color: Colors.black),
          todayBorderColor: Colors.transparent,
          todayButtonColor: Color.fromARGB(255, 245, 242, 242),
          weekFormat: false,
          // markedDatesMap: _markedDateMap,
          height: 420.0,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: true,

          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }
}
