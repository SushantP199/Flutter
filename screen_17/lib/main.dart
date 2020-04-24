import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
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
                  child: Stack(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/Rectangle.png'),
                        fit: BoxFit.fill,
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'MarketPlace',
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
                          SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              color: Color.fromRGBO(99, 203, 218, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'Data Streams',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 13.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              color: Color.fromRGBO(99, 203, 218, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'Data Sources',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 13.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              color: Color.fromRGBO(99, 203, 218, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'Data Projects (coming soon)',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 13.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )

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
