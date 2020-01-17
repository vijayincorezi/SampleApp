import 'dart:convert';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class HolidaysPage extends StatefulWidget {
  @override
  _HolidaysPage createState() => _HolidaysPage();
}

class _HolidaysPage extends State<HolidaysPage> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();

    _events = {
      // [(DateTime.parse("2019-12-15 12:00:00.000Z"),"New"],
    };

    // _events[DateTime.parse("2019-12-16 12:00:00.000Z")]=("Chritmas") as List;
    //_events[DateTime.parse("2019-12-25 12:00:00.000Z")].add("Chritmas");
    _selectedEvents = [];
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Text(
            "Vijay Creations",
            style: TextStyle(
                color: Color(0xff2F23F3),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF119FF1))),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Colors.orange,
                  selectedColor: Colors.deepPurple,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                print(date);
                setState(() {
                  _selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),
            ..._selectedEvents.map((event) => ListTile(
                  title: Text(event),
                )),
          ],
        ),
      ),
      floatingActionButton: Container(
         // width: 50.0,
         // height: 50.0,
         // margin: const EdgeInsets.all(5.0),
        child: FloatingActionButton.extended(
        
        
           label: Text('Show Holidays'),
      icon: Icon(Icons.favorite),
      backgroundColor: Colors.pink,
           // backgroundColor: Color(0xff2F23F3),
            onPressed: () {
              setState(() {
                _events[DateTime.parse("2020-01-01 12:00:00.000Z")] = [
                  "New year - All Day"
                ];

                _events[DateTime.parse("2020-01-15 12:00:00.000Z")] = [
                  "Pongal - All Day"
                ];

                _events[DateTime.parse("2020-02-21 12:00:00.000Z")] = [
                  "Maha Sivaratri - All Day"
                ];

               // _events[DateTime.parse("2020-03-01 12:00:00.000Z")] = [
               //   "Labor Day - All Day"
               // ];

                _events[DateTime.parse("2020-08-12 12:00:00.000Z")] = [
                  "Janmashtami - All Day"
                ];

                _events[DateTime.parse("2020-10-02 12:00:00.000Z")] = [
                  "Gandhi Jayanti - All Day"
                ];

                _events[DateTime.parse("2020-11-13 12:00:00.000Z")] = [
                  "Diwali - All Day"
                ];

                _events[DateTime.parse("2020-12-25 12:00:00.000Z")] = [
                  "Chritmas - All Day"
                ];

                //--------------------Two bonus----------------------------------------------------

                _events[DateTime.parse("2020-03-10 12:00:00.000Z")] = [
                  "Holi - Limited"
                ];
                _events[DateTime.parse("2020-03-25 12:00:00.000Z")] = [
                  "Ugadi - Limited"
                ];

                _events[DateTime.parse("2020-04-10 12:00:00.000Z")] = [
                  "Good Friday - Limited"
                ];

                _events[DateTime.parse("2020-05-25 12:00:00.000Z")] = [
                  "Ramzan - Limited"
                ];
                _events[DateTime.parse("2020-08-21 12:00:00.000Z")] = [
                  "Onam - Limited"
                ];

                _events[DateTime.parse("2020-10-30 12:00:00.000Z")] = [
                  "Miladi un Nabi - Limited"
                ];

                prefs.setString("events", json.encode(encodeMap(_events)));
                _eventController.clear();
                // Navigator.pop(context);
              });
              
            }
            //_showAddDialog,
            ),
      ),
    );
  }

  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _eventController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {},
                )
              ],
            ));
  }
}
