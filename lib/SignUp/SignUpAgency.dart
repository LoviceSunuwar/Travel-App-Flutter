import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:travelagent_fyp/Components/SignUpLogoAgency.dart';
import 'package:travelagent_fyp/Components/SignUpLogoGuide.dart';
import 'package:travelagent_fyp/Login/Login.dart';
import 'package:validators/validators.dart' as validator;

class AgencySignUp extends StatefulWidget {
  @override
  _AgencySignUpState createState() => _AgencySignUpState();
}

  String email;
  String password;


class _AgencySignUpState extends State<AgencySignUp> {

  String _username;
  String _email;
  String _password;
  String _agencyname;
  String _address;
  String _contact;
  String _about;
  String _panNo;
  
  final _formkey = GlobalKey<FormState>();

    TextEditingController agencyNamecontrol = new TextEditingController();
    TextEditingController addresscontrol = new TextEditingController();
    TextEditingController contactcontrol = new TextEditingController();
    TextEditingController aboutcontrol = new TextEditingController();
    TextEditingController panNocontrol = new TextEditingController();
    TextEditingController usernamecontrol = new TextEditingController();
    TextEditingController emailcontrol = new TextEditingController();
    TextEditingController passwordcontrol = new TextEditingController();

  // void insertAgencyLoginDetail(){

  //   var url="http://10.0.2.2:81/api_travelagentfyp/FetchAgencyLoginDetail.php";
  //   http.post(url, body: 
  //   {
  //     "_Username": usernamecontrol.text,
  //     "_Email": emailcontrol.text,
  //     "_Password": passwordcontrol.text,

  //   }
  //   );
  // }

  
File _image;
Future getImageGallery() async{
  var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);


  setState(() {
      _image = imageFile;
    });
}

Future upload(File imageFile) async{
  var stream= new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length= await imageFile.length();
  var uri = Uri.parse("http://10.0.2.2:81/api_travelagentfyp/InsertAgencyProfile.php");

  var request = new http.MultipartRequest("POST", uri);

  var multipartFile = new http.MultipartFile("_image", stream, length, filename: basename(imageFile.path)); 
  
       
  request.fields['_Username']= usernamecontrol.text;
  request.fields['_Email']= emailcontrol.text;
  request.fields['_Password']= passwordcontrol.text;
  request.fields['_agencyname']= agencyNamecontrol.text;
  request.fields['_address']= addresscontrol.text;
  request.fields['_panNo']= panNocontrol.text;
  request.fields['_Contact']= contactcontrol.text;
  request.fields['_About']= aboutcontrol.text;
  request.files.add(multipartFile); 

  var response = await request.send();

  if(response.statusCode==200){
    print("Image Uploaded");
  }else{
    print("Upload Failed");
  }
  response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
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
  

Widget _buildAgencyName () {
return TextFormField(
          controller: agencyNamecontrol,
          decoration: InputDecoration(
          hintText: 'Agency name',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your Agency Name.';
          }
        },
        onSaved: (String value){
          _agencyname = value;
        },
    );
}


Widget _buildAddress () {
return TextFormField(
          controller: addresscontrol,
          decoration: InputDecoration(
          hintText: 'Address',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your Address.';
          }
        },
        onSaved: (String value){
          _address = value;
        },
    );
}


Widget _buildcontact () {
return TextFormField(
          controller: contactcontrol,
          decoration: InputDecoration(
          hintText: 'Contact',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your Contact no..';
          }
        },
        onSaved: (String value){
         _contact = value;
        },
    );
}


Widget _buildTPanNo () {
return TextFormField(
          controller: panNocontrol,
          decoration: InputDecoration(
          hintText: 'Pan Number',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your Pan Number';
          }
        },
        onSaved: (String value){
          _panNo = value;
        },
    );
}

Widget _buildAbout () {
return TextFormField(
          controller: aboutcontrol,
          decoration: InputDecoration(
          hintText: 'About Your Agency',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your Agency Information';
          }
        },
        onSaved: (String value){
          _about = value;
        },
    );
}

Widget _showImage() {
  return Container( 
    child: _image==null
    ? new Text("No Image Selected!")
    : new Image.file(_image),
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
                child: AgencySignUpLogo(),
              ),
              _buildUsername(),
              SizedBox(height: 10.0),
              _buildEmail(),
              SizedBox(height: 10.0),
              _buildPassword(),
              SizedBox(height: 10.0),
              SingleChildScrollView(child: _buildConfirmPassword()),
              SizedBox(height: 10.0),
              _buildAgencyName(),
          SizedBox(height: 10,),
          _buildAddress(),
          SizedBox(height: 10,),
          _buildTPanNo(),
          SizedBox(height: 10,),
          _buildcontact(),
          SizedBox(height: 10,),
          _buildAbout(),
          SizedBox(height: 10,),
          _showImage(),
          SizedBox(height: 10,),
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
                          getImageGallery();
                        },
                                child:
                         Center(
                         child: Text('Choose Image',
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
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(20.0)),
                        child: InkWell(
                        onTap: () {

                          
                                  if(!_formkey.currentState.validate()){
                                    return null;
                                  }

                                  _formkey.currentState.save();
                                  upload(_image);
                                  Navigator.of(context).pushNamed('/WelcomeAgency');
                                  
                        },
                                child:
                         Center(
                         child: Text('Create Profile',
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
           SizedBox(height: 20.0),
            ],
          ),
          ],
      )
      ),

    );
  }
}