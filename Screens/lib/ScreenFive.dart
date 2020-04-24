import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenFive extends StatefulWidget {
  @override
  _ScreenFiveState createState() => _ScreenFiveState();
}

class _ScreenFiveState extends State<ScreenFive> {
  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';
  double ver = 0.0;
  List _validate = [true, true, true];

  void inputValidation() {
    (currentPassword != '') ? _validate[0] = true : _validate[0] = false;
    (newPassword != '') ? _validate[1] = true : _validate[1] = false;
    (confirmPassword != '') ? _validate[2] = true : _validate[2] = false;
  }

  String verifyPassword1() {
    if (_validate[1]) {
      if (newPassword != '') {
        if (newPassword == confirmPassword) {
          return null;
        } else {
          return 'New & Repeat Password does not match';
        }
      } else {
        return null;
      }
    } else {
      return 'Field is empty';
    }
  }

  String verifyPassword2() {
    if (_validate[2]) {
      if (confirmPassword != '') {
        if (newPassword == confirmPassword) {
          return null;
        } else {
          return 'New & Repeat Password does not match';
        }
      } else {
        return null;
      }
    } else {
      return 'Field is empty';
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Asset',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(120.0, 60.0, 120.0, 10.0),
                    child: Image.asset('images/logo.png'),
                  ),
                  Text(
                    '#MyDataMyAsset',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(45, 75, 92, 1.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 20.0, 15.0, 20.0),
                    padding: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Settings',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(45, 75, 92, 1.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Security-Password',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 13.0,
                                  color: Color.fromRGBO(45, 75, 92, 1.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: TextField(
                                onChanged: (text) {
                                  currentPassword = text;
                                },
                                obscureText: true,
                                cursorColor: Color.fromRGBO(45, 75, 92, 1.0),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  filled: true,
                                  fillColor: Color.fromRGBO(244, 246, 249, 1.0),
                                  hintText: 'Current Password',
                                  errorText:
                                      (_validate[0]) ? null : 'Field is empty',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(45, 75, 92, 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(244, 246, 249, 1.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(244, 246, 249, 1.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                autofocus: false,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: TextField(
                                onChanged: (text) {
                                  newPassword = text;
                                },
                                obscureText: true,
                                cursorColor: Color.fromRGBO(45, 75, 92, 1.0),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  filled: true,
                                  fillColor: Color.fromRGBO(244, 246, 249, 1.0),
                                  hintText: 'New Password',
                                  errorText: verifyPassword1(),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(45, 75, 92, 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(244, 246, 249, 1.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(244, 246, 249, 1.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                autofocus: false,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: TextField(
                                onChanged: (text) {
                                  confirmPassword = text;
                                },
                                obscureText: true,
                                cursorColor: Color.fromRGBO(45, 75, 92, 1.0),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  filled: true,
                                  fillColor: Color.fromRGBO(244, 246, 249, 1.0),
                                  hintText: 'Repeat New Password',
                                  errorText: verifyPassword2(),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(45, 75, 92, 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(244, 246, 249, 1.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(244, 246, 249, 1.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                autofocus: false,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            SizedBox(
                              width: 300.0,
                              height: 50.0,
                              child: RaisedButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {
                                  setState(() {
                                    inputValidation();
                                  });
                                },
                                color: Color.fromRGBO(99, 203, 218, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  'Confirm Password Change',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
