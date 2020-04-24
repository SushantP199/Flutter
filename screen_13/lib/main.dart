import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget bodyOptionsOne() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 3.5, 4.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/BgOne.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 15.0, 5.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/account.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(45.0, 50.0, 0.0, 0.0),
                child: Text(
                  'Account',
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
                margin: EdgeInsets.fromLTRB(3.5, 0.0, 30.0, 4.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/BgTwo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100.0, 15.0, 0.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/security.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                child: Text(
                  'Security',
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
    );
  }

  Widget bodyOptionsTwo() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 4.0, 3.5, 0.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/BgThree.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 15.0, 5.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/help.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(45.0, 50.0, 0.0, 0.0),
                child: Text(
                  'Help',
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
                margin: EdgeInsets.fromLTRB(3.5, 4.0, 30.0, 0.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
		  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/BgFour.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100.0, 15.0, 0.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/t&c.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                child: Text(
                  'Terms of Service',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 13.0,
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
                            padding: const EdgeInsets.only(top: 10.0),
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
