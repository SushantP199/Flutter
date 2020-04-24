import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AwesomeAccount extends StatefulWidget {
  @override
  _AwesomeAccountState createState() => _AwesomeAccountState();
}

class _AwesomeAccountState extends State<AwesomeAccount> {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/logo.png'), context);
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
                    margin: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Awesome!',
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w900,
                                          color: Color.fromRGBO(45, 75, 92, 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'You are one step away from',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(45, 75, 92, 1.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'becoming a',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(45, 75, 92, 1.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '#datapreneur.',
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(45, 75, 92, 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Please complete',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(45, 75, 92, 1.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'your account details below',
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(45, 75, 92, 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 300.0,
                              height: 50.0,
                              child: RaisedButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {
                                  setState(() {});
                                },
                                color: Color.fromRGBO(99, 203, 218, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  'Account',
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
