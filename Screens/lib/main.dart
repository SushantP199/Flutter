/// This is files for keep track of all files
/// Please use ohers files in [lib folder for yorr project]

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ScreenFour.dart';
import 'ScreenFive.dart';
import 'Screen15.dart';
import 'Screen16.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var screennumber;

  @override
  Widget build(BuildContext context) {
    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Place no to navigate
    screennumber = 16;

    switch (screennumber) {
      case 4:
        return ScreenFour();
      case 5:
        return ScreenFive();

      /// For using camera diadgShow should be call on body of sacffold not as a materialapp because it is a [Future] event
      case 15:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Data Asset',
          home: Scaffold(
            backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
            body: Screen15(),
          ),
        );
      case 16:
        return Screen16();
      default:
        print("Something mess up ");
    }
  }
}
