import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:travelagent_fyp/HomeScreen/HomeScreen.dart';
import 'dart:convert';
import 'package:travelagent_fyp/HomeScreen/HomeScreenAgency.dart';
import 'package:travelagent_fyp/HomeScreen/HomeScreenSurf.dart';
import 'package:travelagent_fyp/SignUp/SignUpTourist.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
TextEditingController emailcontrol= new TextEditingController();
TextEditingController pass= new TextEditingController();

String msg='';

Future<List> _login() async {
  final response = await http.post("http://10.0.2.2:81/api_travelagentfyp/api_login.php",
  body: {
    "_Email": emailcontrol.text,
    "_Password": pass.text,
  });

//print(response.body);

  var datauser = json.decode(response.body);
  print(datauser);
  print(datauser.length);
  if(datauser.length==1){

  if(datauser[0]['LoginLevel']=='Agency'){
      print("Welcome Agency");
      Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new AgencyHomeScreen())
                        );}
  else 
        if(datauser[0]['LoginLevel']=='Guide'){
         Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new HomeScreen())
                        );}
  else 
          if(datauser[0]['LoginLevel']=='Tourist'){
            print("Welcome tourist");
            Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new HomeScreen())
                       );}
          //Navigator.pushReplacementNamed(context, '/HomeScreen');}
      
   }
  else{
    
    print("Sorry the infomration does not match.");
  }
  
  return datauser;
  
}

 @override 
     Widget build(BuildContext context) {
        return Scaffold( 
          body: SingleChildScrollView(
                      child: Column(
              children: <Widget>[
                  Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 65, 0, 0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Travel',
                          style: TextStyle(
                            fontSize: 75, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 135, 0, 0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Agent',
                          style: TextStyle(
                            fontSize: 75, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(110, 50, 0, 0),
                        child: ImageLogo(),
                      ),
                      
                    ],
                  ), // stack is used to pile up one after another
                ),
                new Text(msg,
                      style: TextStyle(
                        fontSize: 20.0, 
                        color: Colors.red),
                        ),
                Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      
                      TextField(
                        controller: emailcontrol,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        controller: pass,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow
                            ),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0,),
                      Container(
                        padding: EdgeInsets.only(top: 15.0, left: 190.0,),
                        child: InkWell(
                          child: Text('Forgot Password',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.yellowAccent,
                          color: Colors.yellow,
                          elevation: 7.0,
                          child:new RaisedButton(
                            
                            onPressed: () {
                              _login();
                            },
                            child: Center(
                              child: Text('Log In',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.yellowAccent,
                          color: Colors.yellow,
                          elevation: 7.0,
                          child: new RaisedButton(
                            onPressed:  () {Navigator.push(context, new MaterialPageRoute(
                          builder: (context) =>
                            new TouristSignUp())
                          );},
                            child: Center(
                              child: Text('Register',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.yellowAccent,
                          color: Colors.grey,
                          elevation: 7.0,
                          child: new RaisedButton(
                            
                            onPressed: () {Navigator.push(context, new MaterialPageRoute(
                          builder: (context) =>
                            HomeScreenSurf())
                            );},
                            child: Center(
                              child: Text('Just Surf',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          backgroundColor: Colors.indigoAccent[200],
        );
      }


}

class ImageLogo extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/images/Logo.png');
    Image image = Image(image:  assetImage);
    return Container(
      alignment: Alignment.topRight,
      child:  image,
      );
      
  }

}


