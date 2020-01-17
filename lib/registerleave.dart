import 'package:flutter/material.dart';

class RegisterLeavePage extends StatefulWidget {
  @override
  _RegisterLeavePageState createState() => _RegisterLeavePageState();
}

class _RegisterLeavePageState extends State<RegisterLeavePage> {
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
      
      appBar: new AppBar(
          title: Text(
            "C O R E Z I",
            style: TextStyle(
                color: Color(0xff2F23F3),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF119FF1))),
      body: Container(
        padding:
        
            EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(
              height: 40.0,
            ),
            //    buildTextField("Email"),
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 2.5,),
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

           
          ],
        ),
      ),
    );
  }
}
