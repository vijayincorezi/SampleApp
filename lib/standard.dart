import 'package:vijaycreations/holidays.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import "registerleave.dart";

class StandardPage extends StatefulWidget {
  @override
  _StandardPageState createState() => _StandardPageState();
}

class _StandardPageState extends State<StandardPage> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0xFF119FF1),
          currentIndex: _bottomNavIndex,
          onTap: (int index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          items: [
            new BottomNavigationBarItem(
                title: new Text('Home'), icon: new Icon(Icons.home)),
            new BottomNavigationBarItem(
                title: new Text(''), icon: new Icon(Icons.local_offer)),
            new BottomNavigationBarItem(
                title: new Text(''), icon: new Icon(Icons.message)),
            new BottomNavigationBarItem(
                title: new Text(''), icon: new Icon(Icons.notifications))
          ],
        ),
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
            // actions: <Widget>[
            //   Icon(Icons.arrow_back_ios),
            //
            // ],
            iconTheme: new IconThemeData(color: Color(0xFF119FF1))),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: new Container(
                  child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Text(
                        "Explore",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  new SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      new Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new Container(
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(10.0),
                                color: Color(0xFFFD7384),
                              ),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.category,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  new Text("Chat Box",
                                      style:
                                          new TextStyle(color: Colors.white)),
                                ],
                              )),
                        ),
                      ),
                      new Expanded(
                        child: new Container(
                          height: 100.0,
                          child: new Column(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 2.5),
                                  child: new Container(
                                      decoration: new BoxDecoration(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                        color: Colors.redAccent,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Icon(
                                            Icons.notifications_active,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          new Text(" Notice",
                                              style: new TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2.5),
                                  child: new Container(
                                      decoration: new BoxDecoration(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                        color: Colors.purpleAccent,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Icon(
                                            Icons.contact_mail,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          new Text(" Attendance",
                                              style: new TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      new Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: new Container(
                            height: 100.0,
                            child: new Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2.5, bottom: 2.5),
                                    child: new Container(
                                        decoration: new BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                          color: Colors.lightBlueAccent,
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HolidaysPage()),
                                            );
                                          },
                                          child: Container(
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.date_range,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                                new Text("Days",
                                                    style: new TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.5, left: 2.5),
                                    child: new Container(
                                        decoration: new BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                          color: Colors.orange[300],
                                        ),
                                        child: FlatButton(
                                          onPressed: () {   
                                            print("pressed");                                         
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterLeavePage()),
                                            );
                                          },
                                          child: Container(
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.restore,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                                new Text("Time",
                                                    style: new TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            )
          ],
        ));
  }
}
