import 'package:flutter/material.dart';
import 'package:travelagent_fyp/Login/Login.dart';

class WelcomePageAgency extends StatefulWidget {
  @override
  _WelcomePageAgencyState createState() => _WelcomePageAgencyState();
}

class _WelcomePageAgencyState extends State<WelcomePageAgency> {
Widget _logo () {
  return Container(
    child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Text(
                            'Travel ',
                            style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                          'Agent',
                          style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold
                          ),
                        ),
                      
                    ImageLogo(),
                  ],
                ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
      _logo(),
      SizedBox(height: 50),
      
        ],
      ),
    );
  }
}