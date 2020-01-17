import 'package:vijaycreations/holidays.dart';
import 'package:vijaycreations/standard.dart';
import 'package:flutter/material.dart';
import "signup.dart";
import 'dart:async';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF2508FF), fontFamily: "Ubuntu"),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  bool _isHidden = true;
  FocusNode textSecondFocusNode = new FocusNode();
  //get myController1 => null;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
              child: Container(
          padding:
              EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                
                "assets/vijaycreations.png",
                width: 450,
                height: 130,
              ),
              //SizedBox(height: 40.0,),

           
              TextFormField(
                //   textInputAction: TextInputAction.next,
                //String hintText="Email";
                controller: myController1,
                //autofocus: false,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon:
                      "Email" == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
                  suffixIcon: "Email" == "Password"
                      ? IconButton(
                          onPressed: _toggleVisibility,
                          icon: _isHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        )
                      : null,
                ),

                obscureText: "Email" == "Password" ? _isHidden : false,
                onFieldSubmitted: (String value) {
                  FocusScope.of(context).requestFocus(textSecondFocusNode);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              // buildTextField("Password"),
              TextFormField(
                focusNode: textSecondFocusNode,
                //textInputAction: TextInputAction.next,
                //String hintText="Email";
                controller: myController2,
                //autofocus: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: "Email" == "Password"
                      ? Icon(Icons.email)
                      : Icon(Icons.lock),
                  suffixIcon: "Password" == "Password"
                      ? IconButton(
                          onPressed: _toggleVisibility,
                          icon: _isHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        )
                      : null,
                ),
                obscureText: "Password" == "Password" ? _isHidden : false,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Forgotten Password?",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              buildButtonContainer(),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?"),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                          child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(23.0)),
                              child: Text("SIGN UP",
                                  style: TextStyle(
                                    color: Colors.red,
                                  )),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StandardPage()),
                                );
                              }))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildTextField(String hintText) {
  //  return TextField();
  // }

  Widget buildButtonContainer() {
    return Container(
        height: 56.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(colors: [
            Color(0xFF2508FF),
            Color(0xFF2585A9),
            Color(0xFF14F555),
            Color(0xF414F555),
          ], begin: Alignment.centerRight, end: Alignment.centerLeft),
        ),
        child: Center(
          child: Container(
            //minWidth: 200.0,
            height: 100.0,
            width: 500.0,
            child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(23.0)),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  String _email;
                  String _password;
                  String msg;
                  _email = myController1.text;
                  _password = myController2.text;
                  msg = _email + _password;
                  if (_password.length >= 5 &&
                      _email.length >= 10 &&
                      _email.contains("@") &&
                      _email.endsWith(".com")) {
                        myController2.text="";


                      Navigator.of(context, rootNavigator: true).push(
                        
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new StandardPage()));



                     
                                
                    showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 6), () {
                            Navigator.of(context).pop(true);
                          });
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15)),
                         
                            title: Text('Logging you in....'),
                            content: Image.asset( 
                              "assets/loading_gif.gif",
                              width: 250,   
                              height: 70,  
                            ),
                          );
                        });
                  }
                  else
                  {
                     showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 6), () {
                            Navigator.of(context).pop(true);
                          });
                          return AlertDialog(   shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15)),
                          backgroundColor: Colors.white,
                          content: Text(
                            "Invalid Credentials",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              //  child: Text('Ok',),
                              child: Icon(Icons.clear),
                              textColor: Colors.red,
                              
                              onPressed: () {
                                myController2.text="";
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );

                        });}

                  //  return showDialog(
                  //    context: context,
                  //    builder: (context) {
                  //      new Future.delayed(const Duration(seconds: 7), () {
                  //        // When task is over, close the dialog
                  //        Navigator.of(context, rootNavigator: true).pop();
                  //      });
                  //      if (_email.length < 10 ||
                  //          _password.length < 5 ||
                  //          !_email.contains("@") ||
                  //          !_email.endsWith(".com"))  {
                  //        return AlertDialog(
                  //          //shape:CircleBorder(),
                  //          //elevation: 24.0,
                  //          shape: RoundedRectangleBorder(
                  //              borderRadius: new BorderRadius.circular(30)),
                  //          backgroundColor: Colors.white,
                  //          // content:Text("Signed in as "+_email),
//
                  //          title: Text('Logging you in....'),
//
                  //          content: Image.asset(
                  //            "assets/Product-Engineering.gif",
                  //            width: 350,
                  //            height: 270,
                  //          ),
                  //          // Text('Signed in as ' + _email),
                  //          actions: <Widget>[
                  //            new FlatButton(
                  //              child: Icon(Icons.clear),
                  //              textColor: Colors.red,
                  //              onPressed: () {
                  //                myController2.text = "";
                  //                Navigator.pop(
                  //                  context,
                  //                  //MaterialPageRoute(
                  //                  //     builder: (context) => HomePage()),
                  //                );
                  //              },
                  //            ),
                  //            FlatButton(
                  //              //  child: Text('Ok',),
                  //              child: Icon(Icons.check),
                  //              textColor: Colors.green,
                  //              onPressed: () {
                  //                myController2.text = "";
                  //
                  //
//
//
//
//
                  //
                  //              },
                  //            ),
                  //          ],
                  //        );
                  //      }
                  //    },
                  //  );
                  //  print()
                  // FormFieldValidator(value)
                }),
          ),
        ));
  }
}
