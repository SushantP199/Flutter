import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen16 extends StatefulWidget {
  @override
  _Screen16State createState() => _Screen16State();
}

class _Screen16State extends State<Screen16> {
  /// STEP 1 : (optional step u can skip it)
  /// Whenever users login fetch values of [_userlogin] login or not, [_address] current location, [_status] active or not these values should be fetched from database
  /// Or else direct call st
  bool _userLogin = true;
  var _address;
  var _status;

  /// [Reset] is used reset login history
  bool reset;

  /// STEP 2 :
  /// Whenever user login or clicked on login button this method should calledwith values/parameters [address] current location [status] active or not
  void buildHistory(
      {bool userLogin, String address, String status, bool reset: false}) {
    if (reset) {
      logInHistory = <Container>[];
    } else {
      (userLogin)
          ? logInHistory.add(logInLocation(address: address, status: status))
          : null;
    }
  }

  List<Container> logInHistory = <Container>[];

  Widget logInLocation({String address, String status}) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(244, 246, 249, 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: TextField(
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLines: null,
          readOnly: true,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                  height: 10.0,
                  width: 5.0,
                  child: Image.asset('images/location.png')),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 1.0),
            filled: true,
            fillColor: Color.fromRGBO(244, 246, 249, 1.0),
            hintText: '$address\n$status',
            hintStyle: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 13.0,
              color: Color.fromRGBO(45, 75, 92, 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(244, 246, 249, 1.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(244, 246, 249, 1.0),
              ),
            ),
          ),
        ),
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
      title: 'Data Asset',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  /// STEP 3 :
                  /// I am created for testing button if you are done [STEP 1] & [STEP 2] delete my this chunk of code
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        buildHistory(
                            userLogin: true,
                            address: 'Panchkula, 134116, India',
                            status: 'Active Now');
                      });
                    },
                    child: Text('Login'),
                  ),

                  /// Delete above Raisedbutton code [delete]

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
                              padding: EdgeInsets.only(top: 10.0),
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
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Security-Login Activity',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 13.0,
                                  // fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(45, 75, 92, 1.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  filled: true,
                                  fillColor: Color.fromRGBO(244, 246, 249, 1.0),
                                  hintText: 'Where You\'re Logged In ',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 13.0,
                                    color: Color.fromRGBO(45, 75, 92, 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(244, 246, 249, 1.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(244, 246, 249, 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: logInHistory,
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
