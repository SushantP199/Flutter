import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenFour extends StatefulWidget {
  @override
  _ScreenFourState createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  String name = 'jatin chaudhari';
  String email = 'jatin@aiisma.com';
  String contact = 'No contact found';

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
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Container(
                  margin: EdgeInsets.fromLTRB(120.0, 40.0, 120.0, 10.0),
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
                              'Account-Personal Information',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 13.0,
                                // fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(45, 75, 92, 1.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {
                                // Onpress change $name var
                              },
                              color: Color.fromRGBO(244, 246, 249, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    '$name',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: 13.0,
                                      // fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(45, 75, 92, 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {
                                // Onpress change $email var
                              },
                              color: Color.fromRGBO(244, 246, 249, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    '$email',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: 13.0,
                                      // fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(45, 75, 92, 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {
                                // Onpress change $contact var
                              },
                              color: Color.fromRGBO(244, 246, 249, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    '$contact',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: 13.0,
                                      color: Color.fromRGBO(45, 75, 92, 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: RaisedButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              color: Color.fromRGBO(99, 203, 218, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'Identify Confirmation',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 13.0,
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
    );
  }
}
