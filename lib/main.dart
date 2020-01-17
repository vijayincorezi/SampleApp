import 'package:vijaycreations/holidays.dart';
import "package:flutter/material.dart";
import "dart:async";
import "home_page.dart";
void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
              Navigator.push(
                context,
                    MaterialPageRoute(builder: (context) => HomePage()),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      
      body: Column(
         crossAxisAlignment:CrossAxisAlignment.center,
      //: Colors.white70,
        children: <Widget>[
          
          Container(
            
            child: Text("\t\t\t\tPowered by.,",style: TextStyle(fontWeight: FontWeight.bold,),),
            padding: EdgeInsets.only(top: 200),
            
          ),
          Container(
            
            //
            padding: EdgeInsets.only(top: 0,left: 15),  
                      
            child: Center(
              
              child: Image.asset(
               
                "assets/vijaycreations.png",
                width: 150,
                
                height: 70,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
