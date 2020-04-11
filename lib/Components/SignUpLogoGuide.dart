import 'package:flutter/material.dart';
import 'package:travelagent_fyp/Login/Login.dart';
import 'package:travelagent_fyp/SignUp/SignUpAgency.dart';
import 'package:travelagent_fyp/SignUp/SignUpTourist.dart';

class GuideSignUpLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
        elevation: 0.5,
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        actions: <Widget>[
           new ButtonTheme(
             height: 100.0,
             minWidth: 205.0,
             child: RaisedButton(onPressed: () {Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new TouristSignUp())
                        );},
             child: Text('Tourist'),
             color: Colors.lime,
             ),
             ),
             new ButtonTheme(
             height: 100.0,
             minWidth: 205.0,
             child: RaisedButton(onPressed: () {Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new AgencySignUp())
                        );},
             child: Text('Agency'),
             color: Colors.green,
             ),
             ),
        ],
       
    ),
        
    body: new Container(
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