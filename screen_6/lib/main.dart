import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen 6',
      debugShowCheckedModeBanner: false,
      home: ScreenSix(),
    );
  }
}

class ScreenSix extends StatefulWidget {
  @override
  _ScreenSixState createState() => _ScreenSixState();
}
 
class _ScreenSixState extends State<ScreenSix> {

  Widget rowWidget({String theme1, String logo1, String name1, String theme2, String logo2, String name2}) {
    return Row(
      children: <Widget>[
        Expanded(
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
                padding: const EdgeInsets.fromLTRB(35.0, 50.0, 0.0, 0.0),
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
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(3.5, 0.0, 15.0, 8.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
                padding: const EdgeInsets.fromLTRB(110.0, 15.0, 0.0, 0.0),
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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                              'Marketplace',
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
                            'Data Sources',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(45, 75, 92, 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height:30.0),
                        rowWidget(theme1: 'ThemeBgOne', logo1: 'instagram', name1: 'Instagram', theme2: 'ThemeBgTwo', logo2: 'facebook', name2: 'Facebook'),
                        rowWidget(theme1: 'ThemeBgTwo', logo1: 'youtube', name1:'Youtube', theme2: 'ThemeBgOne', logo2: 'amazon', name2: 'Amazon'),
                        rowWidget(theme1: 'ThemeBgOne', logo1: 'netflix', name1: 'Netflix', theme2: 'ThemeBgTwo', logo2: 'fitbit', name2: 'Fitbit'),
                        rowWidget(theme1: 'ThemeBgTwo', logo1: 'twitter', name1: 'Twitter', theme2: 'ThemeBgOne', logo2: 'finance', name2: 'Finance'),
                        // rowWidget(theme1: 'ThemeBgOne', logo1: 'spotify', name1: 'Spotify', theme2: 'cheatHide', logo2: 'cheatLogo', name2: ''),
                        Row(
      children: <Widget>[
        Expanded(
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
                    image: AssetImage('images/ThemeBgOne.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 15.0, 5.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/twitter.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 50.0, 0.0, 0.0),
                child: Text(
                  'Twitter',
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
        // This Sudo code that does nothing just protect expansion of above twitter widget
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(3.5, 0.0, 15.0, 8.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/cheatHide.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(110.0, 15.0, 0.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/cheatLogo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
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
    )
                      ],
                    ),
                  ],
                ),
              ),           ],
          ),
        ),
      )
    );
  }
}