import 'package:flutter/material.dart';
import 'package:travelagent_fyp/HomeScreen/Welcome.dart';
import 'package:travelagent_fyp/HomeScreen/WelcomeAgency.dart';
import 'package:travelagent_fyp/HomeScreen/WelcomeGuide.dart';
import 'package:travelagent_fyp/Package/AddDMC.dart';
import 'package:travelagent_fyp/Package/AddPackage.dart';

import 'Login/Login.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Login(),
      routes: <String, WidgetBuilder>{
        
      '/LogIn': (BuildContext context) => new Login(),
      '/AddPackage': (BuildContext context) => new AddPackage(),
      '/AddDMC': (BuildContext context) => new AddDMC(),
      '/Welcome': (BuildContext context) => new WelcomePage(),
      '/WelcomeGuide': (BuildContext context) => new WelcomePageGuide(),
      '/WelcomeAgency': (BuildContext context) => new WelcomePageAgency(),
      },

    );
  }
}