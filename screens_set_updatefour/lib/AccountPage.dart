import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountPage extends StatelessWidget {
  void boostImageLoading({BuildContext context}) {
    /// Trick for Fast loading of images
    precacheImage(AssetImage('images/logo.png'), context);
    precacheImage(AssetImage('images/Aiisma.png'), context);
    precacheImage(AssetImage('images/token.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    boostImageLoading(context: context);

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
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Stack(children: <Widget>[
                    Column(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 30.0),
                          child: Image.asset('images/Aiisma.png'),
                        ),
                      ],
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
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
                            'Login with Password',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(45, 72, 92, 1.0),
                                ),
                              ),
                              onTap:
                                  () {} //Add link inside as onTap:(){launch('your link to wake up forgot password page )}
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Stack(
                          children: <Widget>[
                            Divider(),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 11.0,
                                  color: Color.fromRGBO(45, 72, 92, 1.0),
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
                          onPressed: () {},
                          color: Color.fromRGBO(99, 203, 218, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset('images/token.png'),
                              ),
                              SizedBox(width: 10.0,),
                              Text(
                                'Create New Aiisma Account',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
