import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AiiHealthContactTracingExposure extends StatefulWidget {
  @override
  _AiiHealthContactTracingExposureState createState() =>
      _AiiHealthContactTracingExposureState();
}

class _AiiHealthContactTracingExposureState
    extends State<AiiHealthContactTracingExposure> {
  List<String> ans = ['', '', '', '', '', ''];

  void saveAnswer({String value, int queryNumber}) {
    (value == 'yes') ? ans[queryNumber] = 'yes' : ans[queryNumber] = 'No';
  }

  Widget exposureRow({String question, int queryNumber}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 2.5),
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$question',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 13.0,
                ),
              ),
            ),
            Container(
              child: SizedBox(
                height: 30.0,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                      child: Radio(
                        activeColor: Color.fromRGBO(99, 203, 218, 1.0),
                        value: 'yes',
                        groupValue: ans[queryNumber],
                        onChanged: (value) {
                          setState(() {
                            saveAnswer(value: value, queryNumber: queryNumber);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 30.0),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                      child: Radio(
                        value: 'No',
                        groupValue: ans[queryNumber],
                        activeColor: Color.fromRGBO(99, 203, 218, 1.0),
                        onChanged: (value) {
                          setState(() {
                            saveAnswer(value: value, queryNumber: queryNumber);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 30.0),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
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
                              'AiiHealth',
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
                            'Contact Tracing - Exposure',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(45, 75, 92, 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Travel Exposure',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Past 14 days have you travelled to any',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                        exposureRow(
                            question: 'Large gatherings ?', queryNumber: 0),
                        exposureRow(
                            question: 'International destination ?',
                            queryNumber: 1),
                        exposureRow(
                            question: 'Identified hotspots ?', queryNumber: 2),
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Social Exposure',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Past few week have you met anyone with',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                        exposureRow(
                            question: 'Dry cough and fever ?', queryNumber: 3),
                        exposureRow(
                            question: 'Confirmed positive diagnosis ?',
                            queryNumber: 4),
                        exposureRow(
                            question: 'Travel history to identified hotspots ?',
                            queryNumber: 5),
                        SizedBox(height: 30.0,),
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
                              'Submit',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
