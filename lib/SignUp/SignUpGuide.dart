import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:travelagent_fyp/Components/SignUpLogoGuide.dart';
import 'package:travelagent_fyp/Login/Login.dart';
import 'package:validators/validators.dart' as validator;

class GuideSignUp extends StatefulWidget {
  @override
  _GuideSignUpState createState() => _GuideSignUpState();
}

  String email;
  String password;


class _GuideSignUpState extends State<GuideSignUp> {

  String _username;
  String _email;
  String _password;

  String _firstname;
  String _lastname;
  String _age;
  String _address;
  String _contact;
  String _about;
  String _points;
  String _licno;
  String _language;

  final _formkey = GlobalKey<FormState>();

    TextEditingController fnamecontrol = new TextEditingController();
    TextEditingController lnamecontrol = new TextEditingController();
    TextEditingController agecontrol = new TextEditingController();
    TextEditingController addresscontrol = new TextEditingController();
    TextEditingController contactcontrol = new TextEditingController();
    TextEditingController aboutcontrol = new TextEditingController();
    TextEditingController pointcontrol = new TextEditingController();
    TextEditingController licnocontrol = new TextEditingController();
    TextEditingController usernamecontrol = new TextEditingController();
    TextEditingController emailcontrol = new TextEditingController();
    TextEditingController passwordcontrol = new TextEditingController();

  // void insertGuideLoginDetail(){

  //   var url="http://10.0.2.2:81/api_travelagentfyp/FetchGuideLoginDetail.php";
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
  var uri = Uri.parse("http://10.0.2.2:81/api_travelagentfyp/InsertGuideProfile.php");

  var request = new http.MultipartRequest("POST", uri);

  var multipartFile = new http.MultipartFile("_image", stream, length, filename: basename(imageFile.path)); 
  
    
  request.fields['_Username']= usernamecontrol.text;
  request.fields['_Email']= emailcontrol.text;
  request.fields['_Password']= passwordcontrol.text;
  request.fields['_FirstName']= lnamecontrol.text;
  request.fields['_FirstName']= fnamecontrol.text;
  request.fields['_LastName']= lnamecontrol.text;
  request.fields['_Age']= agecontrol.text;
  request.fields['_Address']= addresscontrol.text;
  request.fields['_Contact']= contactcontrol.text;
  request.fields['_About']= aboutcontrol.text;
  request.fields['_licno']= licnocontrol.text;
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


Widget _buildFirstName () {
return TextFormField(
          controller: fnamecontrol,
          decoration: InputDecoration(
          hintText: 'First Name',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your First Name.';
          }
        },
        onSaved: (String value){
          _firstname = value;
        },
    );
}


Widget _buildlastName () {
return TextFormField(
          controller: lnamecontrol,
          decoration: InputDecoration(
          hintText: 'Last Name',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your First Name.';
          }
        },
        onSaved: (String value){
          _lastname = value;
        },
    );
}


Widget _buildAge () {
return TextFormField(
          controller: agecontrol,
          decoration: InputDecoration(
          hintText: 'Age',
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
          if(value.length < 2){
            return 'Enter a valid age';
          }
        },
        onSaved: (String value){
          _age = value;
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


Widget _buildaddress () {
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


Widget _buildAbout () {
return TextFormField(
          controller: aboutcontrol,
          decoration: InputDecoration(
          hintText: 'About me',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your Bio';
          }
        },
        onSaved: (String value){
          _about = value;
        },
    );
}

Widget _buildLicNo () {
return TextFormField(
          controller: licnocontrol,
          decoration: InputDecoration(
          hintText: 'Guide License No.',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Fill Guide License No.';
          }
        },
        onSaved: (String value){
          _licno = value;
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
                child: GuideSignUpLogo(),
              ),
              _buildUsername(),
              SizedBox(height: 10.0),
              _buildEmail(),
              SizedBox(height: 10.0),
              _buildPassword(),
              SizedBox(height: 10.0),
              SingleChildScrollView(child: _buildConfirmPassword()),
              SizedBox(height: 10.0),
              _buildFirstName(),
          SizedBox(height: 10,),
          _buildlastName(),
          SizedBox(height: 10,),
          _buildAge(),
          SizedBox(height: 10,),
          _buildcontact(),
          SizedBox(height: 10,),
          _buildaddress(),
          SizedBox(height: 10,),
          _buildLicNo(),
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
          SizedBox(height:30),
          
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
                                  upload(_image);
                                  if(!_formkey.currentState.validate()){
                                    return null;
                                  }

                                  _formkey.currentState.save();
                                  print(_username);
                                  Navigator.of(context).pushNamed('/WelcomeGuide');
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
            ],
          ),
          ],
      )
      ),

    );
  }
}