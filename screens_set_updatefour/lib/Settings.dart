import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatelessWidget {

  Widget bodyOptionsOne() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 0.0, 4.0, 0.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/themeBgOne.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(130.0, 15.0, 10, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/account.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 60.0, 0.0, 0.0),
                child: Text(
                  'Account',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 14.0,
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
                margin: EdgeInsets.fromLTRB(4.0, 0.0, 15.0, 0.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/themeBgTwo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 15.0, 10, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/security.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                child: Text(
                  'Security',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bodyOptionsTwo() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 12.0, 4.0, 0.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/themeBgThree.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(130.0, 25.0, 10.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/help.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 70.0, 0.0, 0.0),
                child: Text(
                  'Help',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 14.0,
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
                margin: EdgeInsets.fromLTRB(4.0, 12.0, 15.0, 0.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/themeBgFour.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 25.0, 10.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/t&c.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                child: Text(
                  'Terms of Service' ,
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void boostImageLoading({BuildContext context}) {
    /// Trick for Fast loading of images  
    precacheImage(AssetImage('images/logo.png'), context);
    precacheImage(AssetImage('images/themeBgOne.png'), context);
    precacheImage(AssetImage('images/themeBgTwo.png'), context);
    precacheImage(AssetImage('images/themeBgThree.png'), context);
    precacheImage(AssetImage('images/themeBgFour.png'), context);
    precacheImage(AssetImage('images/account.png'), context);
    precacheImage(AssetImage('images/security.png'), context);
    precacheImage(AssetImage('images/help.png'), context);
    precacheImage(AssetImage('images/t&c.png'), context);
  }

  @override
  Widget build(BuildContext context) {

    boostImageLoading(context: context);

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
                  margin: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 30.0),
                  padding: EdgeInsets.only(top:20.0, bottom:30.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    borderRadius: BorderRadius.circular(10.0)
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
                                'Settings',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(45, 75, 92, 1.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          bodyOptionsOne(),
                          bodyOptionsTwo(),
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
