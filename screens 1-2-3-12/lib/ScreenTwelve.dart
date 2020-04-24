import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenTwelve extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, ]
    );

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
                  margin: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 40.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ) ,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Help',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(45, 75, 92, 1.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: 15.0,
                                      width: 15.0,
                                      child: Image.asset('images/report.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: SizedBox(
                                        height: 25.0,
                                        width: 150.0,
                                        child: Text(
                                          'Report a Problem',
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(45, 75, 92, 1.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 80.0),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: 15.0,
                                      width: 5.0,
                                      child: Image.asset('images/button.png')
                                    ),
                                  ),
                                ],
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
                                      child: SizedBox(
                                        height: 15.0,
                                        width: 15.0,
                                        child: Image.asset('images/faq.png')
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                        child: SizedBox(
                                          height: 40.0,
                                          width: 190.0,
                                          child: Text(
                                            'FAQ\'s',
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(45, 75, 92, 1.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 40.0),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
                                    child: SizedBox(
                                      height: 15.0,
                                      width: 5.0,
                                      child: Image.asset('images/button.png')
                                    ),
                                  ),
                                ],
                              )
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