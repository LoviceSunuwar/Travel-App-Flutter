import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:travelagent_fyp/Components/SignUpLogoTourist.dart';
import 'package:validators/validators.dart' as validator;

class TouristSignUp extends StatefulWidget {
  @override
  _TouristSignUpState createState() => _TouristSignUpState();
}

  

class _TouristSignUpState extends State<TouristSignUp> {

  String _username;
  String _email;
  String _password;

  final _formkey = GlobalKey<FormState>();


    TextEditingController usernamecontrol = new TextEditingController();
    TextEditingController emailcontrol = new TextEditingController();
    TextEditingController passwordcontrol = new TextEditingController();

  void insertTouristLoginDetail(){

    var url="http://10.0.2.2:81/api_travelagentfyp/FetchTouristLoginDetail.php";
    http.post(url, body: 
    {
      "_Username": usernamecontrol.text,
      "_Email": emailcontrol.text,
      "_Password": passwordcontrol.text,

    }
    );
  }

  Widget _buildUsername() {
    return TextFormField(
          controller: usernamecontrol,
          decoration: InputDecoration(
          hintText: 'User Name',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill the username.';
          }
        },
        onSaved: (String value){
          _username = value;
        },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: emailcontrol,
          decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill the Email.';
          }
           if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
        },
        onSaved: (String value){
          _email = value;
        },
    );
  }
  Widget _buildPassword() {
   return TextFormField(
          controller: passwordcontrol,
          decoration: InputDecoration(
            hintText: 'Password',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: true,
        validator: (String value){
          if(value.isEmpty){
            return 'Password should be atleast 8 character';
          }
        },
        onSaved: (String value){
          _password = value;
        },
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      validator: (String value) {
                    if (value.length < 8) {
                      return 'Password should be atleast 8 character';
                    }
                    else if (_password != null && value != _password) {
                      return "Password does not match";
                    }
                    _formkey.currentState.save();
                    
                  },
        obscureText: true,
       decoration: InputDecoration(
            hintText: 'Confirm Password',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 310,
                child: SignUpLogo(),
              ),
              _buildUsername(),
              SizedBox(height: 10.0),
              _buildEmail(),
              SizedBox(height: 10.0),
              _buildPassword(),
              SizedBox(height: 10.0),
              SingleChildScrollView(child: _buildConfirmPassword()),
              SizedBox(height: 50.0),
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: InkWell(
                                onTap: () {
                                  insertTouristLoginDetail();
                                  if(!_formkey.currentState.validate()){
                                    return null;
                                  }

                                  _formkey.currentState.save();
                                  Navigator.of(context).pushNamed('/SignUpTouristProfile');
                                  print(_username);
                                },
                                child:
                                    Center(
                                      child: Text('Sign Up',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child:
                                    Center(
                                      child: Text('Go Back',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                    ),
                              ),
                            ),
                          ),
            ],
          ),
          ],
      )
      ),

    );
  }
}