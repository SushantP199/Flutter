import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AiiHealthContactTracing extends StatefulWidget {
  @override
  _AiiHealthContactTracingState createState() =>
      _AiiHealthContactTracingState();
}

class _AiiHealthContactTracingState extends State<AiiHealthContactTracing> {
  Widget bodyButtonsOne({String theme1, String logo1, String name1}) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(15.0, 0.0, 3.5, 8.0),
            child: OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {},
              child: Image(
                image: AssetImage('images/$theme1.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(120.0, 15.0, 5.0, 0.0),
            child: Image(
              width: 20.0,
              image: AssetImage('images/$logo1.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 50.0, 0.0, 0.0),
            child: Text(
              '$name1',
              style: TextStyle(
                fontFamily: 'Open Sans',
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyButtonsTwo({String theme2, String logo2, String name2}) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(3.5, 0.0, 15.0, 8.0),
            child: OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {},
              child: Image(
                image: AssetImage('images/$theme2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(110.0, 15.0, 5.0, 0.0),
            child: Image(
              width: 20.0,
              image: AssetImage('images/$logo2.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
            child: Text(
              '$name2',
              style: TextStyle(
                fontFamily: 'Open Sans',
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: Column(
          children: <Widget>[
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
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'AiiHealth',
                            // textAlign: TextAlign.center,
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
                          'Contact Tracing',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(45, 75, 92, 1.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        children: <Widget>[
                          bodyButtonsOne(
                            theme1: 'themeBgThree',
                            logo1: 'exposure',
                            name1: 'Exposure',
                          ),
                          bodyButtonsTwo(
                              theme2: 'themeBgFour',
                              logo2: 'medicalHistory',
                              name2: 'Medical History'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          bodyButtonsOne(
                            theme1: 'themeBgOne',
                            logo1: 'symptoms',
                            name1: 'Symptoms',
                          ),
                          bodyButtonsTwo(
                              theme2: 'themeBgTwo',
                              logo2: 'resources',
                              name2: 'Resources'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          // bodyButtonsOne(theme1: 'themeBgThree', logo1: 'mapView', name1: 'Map',),
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 3.5, 8.0),
                                  child: OutlineButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () {},
                                    child: Image(
                                      image:
                                          AssetImage('images/themeBgThree.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      120.0, 10.0, 5.0, 0.0),
                                  child: Image(
                                    width: 20.0,
                                    image: AssetImage('images/mapView.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      25.0, 40.0, 0.0, 0.0),
                                  child: Text(
                                    'Map View',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      25.0, 60.0, 0.0, 0.0),
                                  child: Text(
                                    '(coming soon)',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                      fontSize: 9.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      3.5, 0.0, 15.0, 8.0),
                                  // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                                  child: FlatButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () {},
                                    child: Image(
                                      image:
                                          AssetImage('images/cheatHide.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      110.0, 15.0, 0.0, 0.0),
                                  child: Image(
                                    width: 20.0,
                                    image: AssetImage('images/cheatLogo.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 50.0, 0.0, 0.0),
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
