import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AiiHealthContactTracingSymptoms extends StatefulWidget {
  @override
  _AiiHealthContactTracingSymptomsState createState() =>
      _AiiHealthContactTracingSymptomsState();
}

class _AiiHealthContactTracingSymptomsState
    extends State<AiiHealthContactTracingSymptoms> {
  List<String> ans = ['', '', '', '', '', '', '', ''];

  void saveAnswer({String value, int queryNumber}) {
    (value == 'yes') ? ans[queryNumber] = 'yes' : ans[queryNumber] = 'No';
  }

  Widget symptomRow({String question, int queryNumber}) {
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
                            'Contact Tracing - Symptoms',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(45, 75, 92, 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        symptomRow(question: 'Rapid Breathing', queryNumber: 0),
                        symptomRow(question: 'Shortness of Breath', queryNumber: 1),
                        symptomRow(question: 'Chest pain with coughing', queryNumber: 2),
                        symptomRow(question: 'Feeling pressure in chest', queryNumber: 3),
                        symptomRow(question: 'Confused mental state', queryNumber: 4),
                        symptomRow(question: 'Blush lips or face', queryNumber: 5),
                        symptomRow(question: 'Changes in awareness', queryNumber: 6),
                        symptomRow(question: 'Feeling fainted while coughing', queryNumber: 7),
                        Container(
                          margin: EdgeInsets.only(top: 2.5, bottom: 3.0),
                          padding: EdgeInsets.all(0.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Respiratory rate (Breaths per minute)',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'NA',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                              ],
                            ),
                          ),
                          Container(
                          margin: EdgeInsets.symmetric(vertical: 3.0),
                          padding: EdgeInsets.all(0.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Pulse rate (Hearthbeats per minute)',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'NA',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                              ],
                            ),
                          ),
                          Container(
                          margin: EdgeInsets.symmetric(vertical: 3.0),
                          padding: EdgeInsets.all(0.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Blood pressure (High or low)',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'NA',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                              ],
                            ),
                          ),
                        // symptomRow(question: 'Respiratory rate (Breaths per minute)', queryNumber: 8),
                        // symptomRow(question: 'Pulse rate (Hearthbeats per minute)', queryNumber: 9),
                        // symptomRow(question: 'Blood pressure', queryNumber: 10),
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
                                fontSize: 13.0,
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
