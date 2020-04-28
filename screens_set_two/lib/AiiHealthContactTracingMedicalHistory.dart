import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/src/material/date_picker.dart';
import 'dart:math';

class AiiHealthContactTracingMedicalHistory extends StatefulWidget {
  @override
  _AiiHealthContactTracingMedicalHistoryState createState() =>
      _AiiHealthContactTracingMedicalHistoryState();
}

class _AiiHealthContactTracingMedicalHistoryState
    extends State<AiiHealthContactTracingMedicalHistory> {
  int conditionNumber;

  List<bool> medicalConditions = <bool>[
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
    false,
    false,
    false,
  ];

  void trackOfMarkedDisease({bool value, int conditionNumber}) {
    setState(() {
      medicalConditions[conditionNumber] = value;
    });
  }

  Widget medicalCondtionRow({String medicalCondition, int conditionNumber}) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          color: Color.fromRGBO(236, 238, 242, 1.0),
          child: Theme(
            data: ThemeData(
                unselectedWidgetColor: Color.fromRGBO(236, 238, 242, 1.0)),
            child: SizedBox(
              height: 16.5,
              width: 16.5,
              child: Checkbox(
                value: medicalConditions[conditionNumber],
                activeColor: Color.fromRGBO(16, 249, 119, 1.0),
                checkColor: Colors.white,
                onChanged: (value) {
                  trackOfMarkedDisease(
                      value: value, conditionNumber: conditionNumber);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$medicalCondition',
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                // color: Color.fromRGBO(45, 75, 92, 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  DateTime _dateTime;
  bool numberFieldL = true;
  bool numberFieldR = true;
  var name,
      dob,
      heightCm,
      weight,
      bloodGroup,
      //bmi,
      chest,
      height,
      waist,
      biceps,
      otherInfo;

  double bmi;

  void saveInputData({String inputData, String textValue}) {
    if (inputData == 'Name') {
      name = textValue;
    }
    if (inputData == 'Date of Birth') {
      dob = textValue;
    }
    if (inputData == 'Height(Cm)') {
      heightCm = textValue; //conflict height
      // print(heightCm);
    }
    if (inputData == 'Weight(Kg)') {
      weight = textValue;
      // print(weight);
    }
    if (inputData == 'Blood Group') {
      bloodGroup = textValue;
    }
    if (inputData == 'BMI') {
      bmi = double.parse(textValue);
    }
    if (inputData == 'Chest') {
      chest = textValue;
    }
    if (inputData == 'Height') {
      height = textValue; //conflict height
    }
    if (inputData == 'Waist') {
      waist = textValue;
    }
    if (inputData == 'Biceps') {
      biceps = textValue;
    }
  }

  Widget textInputRow(
      {String inputLeft,
      bool numberFieldL,
      String inputRight,
      bool numberFieldR}) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5.0),
              width: 145.0,
              child: TextField(
                onChanged: (textValue) {
                  saveInputData(inputData: inputLeft, textValue: textValue);
                  if (inputLeft == 'Height(Cm)') {
                    setState(() {
                      if (weight != null &&
                          heightCm != null &&
                          weight.length > 0 &&
                          heightCm.length > 0) {
                        bmi = double.parse(weight) /
                            (pow(((double.parse(heightCm)) * 0.01), 2));
                        print(bmi);
                      } else {
                        bmi = 0.0;
                      }
                      saveInputData(
                          inputData: 'BMI', textValue: bmi.toString());
                    });
                  }
                },
                controller: (inputLeft == 'Name')
                    ? TextEditingController(text: name)
                    : (inputLeft == 'Height(Cm)')
                        ? (heightCm != null)
                            ? TextEditingController.fromValue(TextEditingValue(
                                text: heightCm,
                                selection: TextSelection.collapsed(
                                    offset: heightCm.length)))
                            : TextEditingController(text: heightCm)
                        : (inputLeft == 'Blood Group')
                            ? TextEditingController(text: bloodGroup)
                            : (inputLeft == 'Chest')
                                ? TextEditingController(text: chest)
                                : (inputLeft == 'Waist')
                                    ? TextEditingController(text: waist)
                                    : TextEditingController(),
                enabled: (inputLeft == 'Name') ? false : true,
                keyboardType:
                    (numberFieldL) ? TextInputType.number : TextInputType.text,
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixStyle: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  filled: true,
                  fillColor: Color.fromRGBO(99, 203, 218, 1.0),
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: '$inputLeft',
                  hintStyle: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(244, 246, 249, 1.0),
                    ),
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
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                autofocus: false,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5.0),
              width: 145.0,
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (textValue) {
                  saveInputData(inputData: inputRight, textValue: textValue);
                  if (inputRight == 'Weight(Kg)') {
                    setState(() {
                      if (weight != null &&
                          heightCm != null &&
                          weight.length > 0 &&
                          heightCm.length > 0) {
                        bmi = double.parse(weight) /
                            pow(((double.parse(heightCm)) * 0.01), 2);
                        print(bmi);
                      } else {
                        bmi = 0.0;
                      }
                      saveInputData(
                          inputData: 'BMI', textValue: bmi.toString());
                    });
                  }
                  ;
                },
                controller: (inputRight == 'Date of Birth' && _dateTime != null)
                    ? TextEditingController(text: dob)
                    : (inputRight == 'BMI' && bmi != null)
                        ? TextEditingController(text: bmi.toStringAsFixed(2))
                        : (inputRight == 'Weight(Kg)')
                            ? (weight != null)
                                ? TextEditingController.fromValue(
                                    TextEditingValue(
                                        text: weight,
                                        selection: TextSelection.collapsed(
                                            offset: weight.length)))
                                : TextEditingController(text: weight)
                            : (inputRight == 'Height')
                                ? TextEditingController(text: height)
                                : (inputRight == 'Biceps')
                                    ? TextEditingController(text: biceps)
                                    : TextEditingController(),
                enabled: (inputRight == 'BMI') ? false : true,
                onTap: () {
                  if (inputRight == 'Date of Birth') {
                    print("DatePicker");
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2021),
                    ).then((date) {
                      setState(() {
                        _dateTime = (date != null) ? date : DateTime.now();
                        var dateFormat = DateTime.parse(_dateTime.toString());
                        dob =
                            "${dateFormat.day}-${dateFormat.month}-${dateFormat.year}";
                        saveInputData(inputData: inputRight, textValue: dob);
                      });
                    });
                  }
                },
                keyboardType:
                    (numberFieldR) ? TextInputType.number : TextInputType.text,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  filled: true,
                  fillColor: Color.fromRGBO(99, 203, 218, 1.0),
                  hintText: (inputRight == 'BMI')
                      ? (bmi != null) ? bmi.toString() : 'BMI'
                      : '$inputRight',
                  hintStyle: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(244, 246, 249, 1.0),
                    ),
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
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                autofocus: false,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
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
                          'Contact Tracing - Medical History',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(45, 75, 92, 1.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      /*buttonRow(
                            buttonLeft: 'Name', buttonRight: 'Date of Birth'),
                        buttonRow(buttonLeft: 'Height', buttonRight: 'Weight'),
                        buttonRow(
                            buttonLeft: 'Blood Group', buttonRight: 'BMI'),*/
                      textInputRow(
                          inputLeft: 'Name',
                          numberFieldL: false,
                          inputRight: 'Date of Birth',
                          numberFieldR: false),
                      textInputRow(
                          inputLeft: 'Height(Cm)',
                          numberFieldL: true,
                          inputRight: 'Weight(Kg)',
                          numberFieldR: true),
                      textInputRow(
                          inputLeft: 'Blood Group',
                          numberFieldL: false,
                          inputRight: 'BMI',
                          numberFieldR: true),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Physical Measurements',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      textInputRow(
                          inputLeft: 'Chest',
                          numberFieldL: true,
                          inputRight: 'Height',
                          numberFieldR: true),
                      textInputRow(
                          inputLeft: 'Waist',
                          numberFieldL: true,
                          inputRight: 'Biceps',
                          numberFieldR: true),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Medical History',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              // color: Color.fromRGBO(45, 75, 92, 1.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Do you have or had history of any of the following medical conditions ?',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              // color: Color.fromRGBO(45, 75, 92, 1.0),
                            ),
                          ),
                        ),
                      ),
                      medicalCondtionRow(
                          medicalCondition: 'Diabetes / Renal Failure',
                          conditionNumber: 0),
                      medicalCondtionRow(
                          medicalCondition: 'Asthma', conditionNumber: 1),
                      medicalCondtionRow(
                          medicalCondition: 'Lung Disease', conditionNumber: 2),
                      medicalCondtionRow(
                          medicalCondition: 'Kidney Transplant',
                          conditionNumber: 3),
                      medicalCondtionRow(
                          medicalCondition: 'Cancer Treatment',
                          conditionNumber: 4),
                      medicalCondtionRow(
                          medicalCondition: 'HIV', conditionNumber: 5),
                      medicalCondtionRow(
                          medicalCondition: 'Smoking Habit',
                          conditionNumber: 6),
                      medicalCondtionRow(
                          medicalCondition: 'Bone Marrow Transplant',
                          conditionNumber: 7),
                      medicalCondtionRow(
                          medicalCondition: 'High BP', conditionNumber: 8),
                      medicalCondtionRow(
                          medicalCondition: 'Heart Disease',
                          conditionNumber: 9),
                      medicalCondtionRow(
                          medicalCondition: 'Tuberculosis',
                          conditionNumber: 10),
                      medicalCondtionRow(
                          medicalCondition: 'Steroid Therapy',
                          conditionNumber: 11),
                      medicalCondtionRow(
                          medicalCondition: 'Dialysis', conditionNumber: 12),
                      medicalCondtionRow(
                          medicalCondition: 'Liver Disease',
                          conditionNumber: 13),
                      medicalCondtionRow(
                          medicalCondition: 'Alcohol Habit',
                          conditionNumber: 14),
                      medicalCondtionRow(
                          medicalCondition: 'None of them',
                          conditionNumber: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 25.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Other Medical Info',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 13.0,
                              color: Color.fromRGBO(45, 75, 92, 1.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25, right: 140),
                        width: 300.0,
                        height: 50.0,
                        margin: EdgeInsets.only(right: 5.0, bottom: 20.0),
                        child: TextField(
                          onChanged: (textValue) {
                            otherInfo = textValue;
                          },
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            suffixStyle: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 13.0,
                              color: Colors.white,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15.0),
                            filled: true,
                            fillColor: Color.fromRGBO(236, 238, 242, 1.0),
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            hintText: '',
                            hintStyle: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 13.0,
                              color: Colors.white,
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
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          autofocus: false,
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
    ));
  }
}
