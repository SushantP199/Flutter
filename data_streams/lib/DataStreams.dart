import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataStreams extends StatefulWidget {
  @override
  _DataStreamsState createState() => _DataStreamsState();
}

class _DataStreamsState extends State<DataStreams> {
  List<String> infoPopUp = <String>[
    'Location insights connect users to close by shops registered with Aiisma, for promotions, coupons and to simplify navigation',
    'Helps to create backups, analyze user behavior and device health. Content is not analyzed, only the user behavior.',
    'Please turn on your GPS ',
    'Analyzes browser navigation, behavior and preferences including time spent on internet. No financial or sensitive user data will be analyzed.',
    'Maps calender usage, synchronization and behaviour, No user information of events and entries are collected.',
    'Analyzes your contact filling behavior. Does not extract contact and their details.',
    'Maps basic device health, usage, synchronization and user behavior navigating the device.',
  ];

  void optionDialogBox(int option) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(99, 203, 218, 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    '${infoPopUp[option]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 17.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  List<bool> index = <bool>[false, false, false, false, false, false, false];

  List<String> theme = <String>[
    'deactivateBg',
    'deactivateBg',
    'deactivateBg',
    'deactivateBg',
    'deactivateBg',
    'deactivateBg',
    'deactivateBg',
  ];

  List<String> check = <String>[
    'deactivate',
    'deactivate',
    'deactivate',
    'deactivate',
    'deactivate',
    'deactivate',
    'deactivate',
  ];

  void onOffOption(int option) {
    switch (option) {
      case 0:
        index[0] = (index[0]) ? false : true;
        if (index[0]) {
          theme[0] = 'activateBg';
          theme[1] = 'activateBg';
          theme[2] = 'activateBg';
          theme[3] = 'activateBg';
          theme[4] = 'activateBg';
          theme[5] = 'activateBg';
          theme[6] = 'activateBg';
          check[0] = 'activate';
          check[1] = 'activate';
          check[2] = 'activate';
          check[3] = 'activate';
          check[4] = 'activate';
          check[5] = 'activate';
          check[6] = 'activate';
        } else {
          theme[0] = 'deactivateBg';
          theme[1] = 'deactivateBg';
          theme[2] = 'deactivateBg';
          theme[3] = 'deactivateBg';
          theme[4] = 'deactivateBg';
          theme[5] = 'deactivateBg';
          theme[6] = 'deactivateBg';
          check[0] = 'deactivate';
          check[1] = 'deactivate';
          check[2] = 'deactivate';
          check[3] = 'deactivate';
          check[4] = 'deactivate';
          check[5] = 'deactivate';
          check[6] = 'deactivate';
        }
        //theme[0] = (index[0]) ? 'activateBg' : 'deactivateBg';
        //check[0] = (index[0]) ? 'activate' : 'deactivate';
        break;
      case 1:
        index[1] = (index[1]) ? false : true;
        theme[1] = (index[1]) ? 'activateBg' : 'deactivateBg';
        check[1] = (index[1]) ? 'activate' : 'deactivate';
        break;
      case 2:
        index[2] = (index[2]) ? false : true;
        theme[2] = (index[2]) ? 'activateBg' : 'deactivateBg';
        check[2] = (index[2]) ? 'activate' : 'deactivate';
        break;
      case 3:
        index[3] = (index[3]) ? false : true;
        theme[3] = (index[3]) ? 'activateBg' : 'deactivateBg';
        check[3] = (index[3]) ? 'activate' : 'deactivate';
        break;
      case 4:
        index[4] = (index[4]) ? false : true;
        theme[4] = (index[4]) ? 'activateBg' : 'deactivateBg';
        check[4] = (index[4]) ? 'activate' : 'deactivate';
        break;
      case 5:
        index[5] = (index[5]) ? false : true;
        theme[5] = (index[5]) ? 'activateBg' : 'deactivateBg';
        check[5] = (index[5]) ? 'activate' : 'deactivate';
        break;
      case 6:
        index[6] = (index[6]) ? false : true;
        theme[6] = (index[6]) ? 'activateBg' : 'deactivateBg';
        check[6] = (index[6]) ? 'activate' : 'deactivate';
        break;
    }
  }

  Widget rowWidget(
      {String theme1,
      String logo1,
      String name1,
      int option1,
      String theme2,
      String logo2,
      String name2,
      int option2}) {
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
                  onPressed: () {
                    setState(() {
                      onOffOption(option1);
                    });
                  },
                  child: Image(
                    image: AssetImage('images/${theme[option1]}.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 15.0, 5.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/${check[option1]}.png'),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(125.0, 52.0, 0.0, 0.0),
                child: GestureDetector(
                  child: Image(
                    width: 15.0,
                    image: AssetImage('images/helpPopup.png'),
                  ),
                  onTap: () {
                    optionDialogBox(option1);
                  },
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
                  onPressed: () {
                    setState(() {
                      onOffOption(option2);
                    });
                  },
                  child: Image(
                    image: AssetImage('images/${theme[option2]}.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/${check[option2]}.png'),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(115.0, 52.0, 0.0, 0.0),
                child: GestureDetector(
                  child: Image(
                    width: 15.0,
                    image: AssetImage('images/helpPopup.png'),
                  ),
                  onTap: () {
                    optionDialogBox(option2);
                  },
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
    precacheImage(AssetImage('images/activateBg.png'), context);
    precacheImage(AssetImage('images/deactivateBg.png'), context);
    precacheImage(AssetImage('images/activate.png'), context);
    precacheImage(AssetImage('images/deactivate.png'), context);
    precacheImage(AssetImage('images/activateAll.png'), context);
    precacheImage(AssetImage('images/storage.png'), context);
    precacheImage(AssetImage('images/location.png'), context);
    precacheImage(AssetImage('images/calendar.png'), context);
    precacheImage(AssetImage('images/contacts.png'), context);
    precacheImage(AssetImage('images/deviceInfo.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    boostImageLoading(context: context);

    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
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
                        SizedBox(height: 30.0),
                        rowWidget(
                          theme1: 'activateBg',
                          logo1: 'activateAll',
                          name1: 'Activate All',
                          option1: 0,
                          theme2: 'deactivateBg',
                          logo2: 'storage',
                          name2: 'Storage',
                          option2: 1,
                        ),
                        rowWidget(
                          theme1: 'deactivateBg',
                          logo1: 'location',
                          name1: 'Get Locations',
                          option1: 2,
                          theme2: 'deactivateBg',
                          logo2: 'netUse',
                          name2: 'Internet Usage',
                          option2: 3,
                        ),
                        rowWidget(
                          theme1: 'deactivateBg',
                          logo1: 'calendar',
                          name1: 'Calender',
                          option1: 4,
                          theme2: 'deactivateBg',
                          logo2: 'contacts',
                          name2: 'Contacts',
                          option2: 5,
                        ),
                        // rowWidget(theme1: 'ThemeBgOne', logo1: 'spotify', name1: 'Spotify', theme2: 'cheatHide', logo2: 'cheatLogo', name2: ''),
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
                                      onPressed: () {
                                        setState(() {
                                          onOffOption(6);
                                        });
                                      },
                                      child: Image(
                                        image: AssetImage(
                                            'images/${theme[6]}.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        35.0, 15.0, 5.0, 0.0),
                                    child: Image(
                                      width: 20.0,
                                      image:
                                          AssetImage('images/${check[6]}.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        120.0, 15.0, 5.0, 0.0),
                                    child: Image(
                                      width: 20.0,
                                      image:
                                          AssetImage('images/deviceInfo.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        35.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Device\nInformation',
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
                                        125.0, 55.0, 0.0, 0.0),
                                    child: GestureDetector(
                                      child: Image(
                                        width: 15.0,
                                        image:
                                            AssetImage('images/helpPopup.png'),
                                      ),
                                      onTap: () {
                                        optionDialogBox(6);
                                      },
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
