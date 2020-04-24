/// This is files for keep track of all files
/// Please use ohers files in [lib folder for ypur projwc]




import 'package:data_asset/ScreenOne.dart';
import 'package:data_asset/ScreenThree.dart';
import 'package:data_asset/ScreenTwelve.dart';
import 'package:data_asset/ScreenTwo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, ]
    );

    /// Place no to navigate
    screennumber = 12;

    switch (screennumber) {
      case 1 : return ScreenOne();
      case 2 : return ScreenTwo();
      case 3 : return ScreenThree();
      case 12 : return ScreenTwelve();
      default: print("Something mess up ");
    }
  }
}