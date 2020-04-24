import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AiiHealthDailyVitals extends StatefulWidget {
  @override
  _AiiHealthDailyVitalsState createState() => _AiiHealthDailyVitalsState();
}

class _AiiHealthDailyVitalsState extends State<AiiHealthDailyVitals> {
  int options;
  List<bool> optionAbsent = <bool>[
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
  List<bool> optionMild = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> optionModerate = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> optionSevere = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  Color optionClicked = Color.fromRGBO(45, 75, 92, 1.0);
  Color optionNotClicked = Color.fromRGBO(99, 203, 218, 1.0);

  void makeSelection({int symptomNumber, int options}) {
    setState(() {
      optionAbsent[symptomNumber] = false;
      optionMild[symptomNumber] = false;
      optionModerate[symptomNumber] = false;
      optionSevere[symptomNumber] = false;
      if (options == 1) {
        optionAbsent[symptomNumber] = true;
      }
      if (options == 2) {
        optionMild[symptomNumber] = true;
      }
      if (options == 3) {
        optionModerate[symptomNumber] = true;
      }
      if (options == 4) {
        optionSevere[symptomNumber] = true;
      }
    });
    print("symptomNumber$symptomNumber");
    print("options$options");
  }

  Widget healthSymptomsRow({String symptom, int symptomNumber}) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.5),
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$symptom',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(45, 75, 92, 1.0),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 30.0,
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        makeSelection(symptomNumber: symptomNumber, options: 1);
                      },
                      color: (optionAbsent[symptomNumber])
                          ? optionClicked
                          : optionNotClicked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Text(
                        'Absent',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 30.0,
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        makeSelection(symptomNumber: symptomNumber, options: 2);
                      },
                      color: (optionMild[symptomNumber])
                          ? optionClicked
                          : optionNotClicked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Text(
                        'Mild',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 30.0,
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        makeSelection(symptomNumber: symptomNumber, options: 3);
                      },
                      color: (optionModerate[symptomNumber])
                          ? optionClicked
                          : optionNotClicked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Text(
                        'Moderate',
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 30.0,
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        makeSelection(symptomNumber: symptomNumber, options: 4);
                      },
                      color: (optionSevere[symptomNumber])
                          ? optionClicked
                          : optionNotClicked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Text(
                        'Severe',
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
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
                margin: EdgeInsets.symmetric(vertical: 15.0),
                padding: EdgeInsets.only(bottom: 20),
                color: Color.fromRGBO(255, 255, 255, 1.0),
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
                            'Daily Vitals',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(45, 75, 92, 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 2.5),
                            padding: EdgeInsets.all(0.0),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Fever (oral temperature)',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(45, 75, 92, 1.0),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: SizedBox(
                                        height: 30.0,
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0.0),
                                          onPressed: () {
                                            makeSelection(
                                                symptomNumber: 0, options: 1);
                                          },
                                          color: (optionAbsent[0])
                                              ? optionClicked
                                              : optionNotClicked,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Text(
                                            '96-98.6F',
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 30.0,
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0.0),
                                          onPressed: () {
                                            makeSelection(
                                                symptomNumber: 0, options: 2);
                                          },
                                          color: (optionMild[0])
                                              ? optionClicked
                                              : optionNotClicked,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Text(
                                            '98.6-102F',
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 30.0,
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0.0),
                                          onPressed: () {
                                            makeSelection(
                                                symptomNumber: 0, options: 3);
                                          },
                                          color: (optionModerate[0])
                                              ? optionClicked
                                              : optionNotClicked,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Text(
                                            '102-104F',
                                            style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 30.0,
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0.0),
                                          onPressed: () {
                                            makeSelection(
                                                symptomNumber: 0, options: 4);
                                          },
                                          color: (optionSevere[0])
                                              ? optionClicked
                                              : optionNotClicked,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Text(
                                            '>104F',
                                            style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        healthSymptomsRow(
                            symptom: 'Dry Cough', symptomNumber: 1),
                        healthSymptomsRow(symptom: 'Fatigue', symptomNumber: 2),
                        healthSymptomsRow(
                            symptom: 'Muscle pain or joint pain',
                            symptomNumber: 3),
                        healthSymptomsRow(
                            symptom: 'Sore throat', symptomNumber: 4),
                        healthSymptomsRow(
                            symptom: 'Headache', symptomNumber: 5),
                        healthSymptomsRow(symptom: 'Chills', symptomNumber: 6),
                        healthSymptomsRow(
                            symptom: 'Nausea or vomiting', symptomNumber: 7),
                        healthSymptomsRow(
                            symptom: 'Nasal congestion', symptomNumber: 8),
                        healthSymptomsRow(
                            symptom: 'Diarrhoea', symptomNumber: 9),
                        healthSymptomsRow(
                            symptom: 'Blood in Phlegm', symptomNumber: 10),
                        healthSymptomsRow(
                            symptom: 'Loss of smell sensation',
                            symptomNumber: 11),
                        healthSymptomsRow(
                            symptom: 'Sneezing', symptomNumber: 12),
                        healthSymptomsRow(
                            symptom: 'Sputum production', symptomNumber: 13),
                        SizedBox(height: 17.5),
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
