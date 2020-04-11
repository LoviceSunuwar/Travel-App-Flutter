import 'package:flutter/material.dart';
import 'package:travelagent_fyp/Login/Login.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        height: 400,
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: new Column(
              children: <Widget>[
              
                new Row(
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
                      //Container(
                        //padding: EdgeInsets.fromLTRB(2, 10, 25, 0),
                        //alignment: Alignment.topLeft,
                        //child:  
                  // ),
              ]
              ),
          ),
    ),
    );
  }
}