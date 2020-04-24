import 'AwesomeAccount.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'ResetPassword.dart';
import 'Login.dart';
import 'Settings.dart';
import 'HomePage.dart';
import 'AccountPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
