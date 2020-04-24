import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() =>
      _WalletState();
}

class _WalletState
    extends State<Wallet> {
  
  var pendingBalance = 400 ;


  @override
  Widget build(BuildContext context) {
    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: SafeArea(
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
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 20.0),
                // color: Color.fromRGBO(255, 255, 255, 1.0),
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
                              'Wallet',
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
                        SizedBox(height: 35.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Pending Balance',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 13.0,
                                color: Color.fromRGBO(45, 75, 92, 1.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: FAProgressBar(
                            backgroundColor: Color.fromRGBO(236, 238, 242, 1.0),
                            changeProgressColor: Colors.blue,
                            progressColor: Color.fromRGBO(47, 75, 92, 1.0),
                            size: 20.0,
                            borderRadius: 20.0,
                            maxValue: 500,
                            currentValue: pendingBalance,
                            displayText: '.00 Aii\'s',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Available Balance',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: SizedBox(
                            width: 130.0,
                            height: 45.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              color: Color.fromRGBO(236, 238, 242, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                '${500 - pendingBalance}.00 Aii\'s',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 13.0,
                                  color: Color.fromRGBO(45, 75, 92, 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        15.0, 0.0, 3.5, 8.0),
                                    child: OutlineButton(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      onPressed: () {},
                                      child: Image(
                                        image: AssetImage(
                                            'images/themeBgThree.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        110.0, 10.0, 5.0, 0.0),
                                    child: Image(
                                      width: 20.0,
                                      image:
                                          AssetImage('images/physicalData.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        25.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Transactions',
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
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        3.5, 0.0, 15.0, 8.0),
                                    child: OutlineButton(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      onPressed: () {},
                                      child: Image(
                                        image: AssetImage(
                                            'images/themeBgFour.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        100.0, 12.0, 5.0, 0.0),
                                    child: Image(
                                      width: 20.0,
                                      image:
                                          AssetImage('images/dailyVitals.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Earn More Aii',
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
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() =>
      _WalletState();
}

class _WalletState
    extends State<Wallet> {
  
  var pendingBalance = 400 ;


  @override
  Widget build(BuildContext context) {
    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: SafeArea(
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
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 20.0),
                // color: Color.fromRGBO(255, 255, 255, 1.0),
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
                              'Wallet',
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
                        SizedBox(height: 35.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Pending Balance',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 13.0,
                                color: Color.fromRGBO(45, 75, 92, 1.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: FAProgressBar(
                            backgroundColor: Color.fromRGBO(236, 238, 242, 1.0),
                            changeProgressColor: Colors.blue,
                            progressColor: Color.fromRGBO(47, 75, 92, 1.0),
                            size: 20.0,
                            borderRadius: 20.0,
                            maxValue: 500,
                            currentValue: pendingBalance,
                            displayText: '.00 Aii\'s',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Available Balance',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: SizedBox(
                            width: 130.0,
                            height: 45.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              color: Color.fromRGBO(236, 238, 242, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                '${500 - pendingBalance}.00 Aii\'s',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 13.0,
                                  color: Color.fromRGBO(45, 75, 92, 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        15.0, 0.0, 3.5, 8.0),
                                    child: OutlineButton(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      onPressed: () {},
                                      child: Image(
                                        image: AssetImage(
                                            'images/themeBgThree.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        110.0, 10.0, 5.0, 0.0),
                                    child: Image(
                                      width: 20.0,
                                      image:
                                          AssetImage('images/physicalData.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        25.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Transactions',
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
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        3.5, 0.0, 15.0, 8.0),
                                    child: OutlineButton(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      onPressed: () {},
                                      child: Image(
                                        image: AssetImage(
                                            'images/themeBgFour.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        100.0, 12.0, 5.0, 0.0),
                                    child: Image(
                                      width: 20.0,
                                      image:
                                          AssetImage('images/dailyVitals.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Earn More Aii',
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
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
>>>>>>> a166a42938d8e6d4333f6e6d23665b4943c77c0a
