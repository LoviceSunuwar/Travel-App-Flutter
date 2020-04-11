import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelagent_fyp/Login/Login.dart';
import 'package:http/http.dart' as http;

class ProfileSignUpGuide extends StatefulWidget {
  @override
  _ProfileSignUpGuideState createState() => _ProfileSignUpGuideState();
}

class _ProfileSignUpGuideState extends State<ProfileSignUpGuide> {

  String _firstname;
  String _lastname;
  String _age;
  String _taddress;
  String _paddress;
  String _contact;
  String _about;
  String _points;
  String _licno;
  String _language;

  final _formkey = GlobalKey<FormState>();

    TextEditingController fnamecontrol = new TextEditingController();
    TextEditingController lnamecontrol = new TextEditingController();
    TextEditingController agecontrol = new TextEditingController();
    TextEditingController taddresscontrol = new TextEditingController();
    TextEditingController paddresscontrol = new TextEditingController();
    TextEditingController contactcontrol = new TextEditingController();
    TextEditingController aboutcontrol = new TextEditingController();
    TextEditingController pointcontrol = new TextEditingController();
    TextEditingController licnocontrol = new TextEditingController();
    TextEditingController languagecontrol = new TextEditingController();

void insertTouristProfile(){
 
    var url="http://10.0.2.2/api_yourtravelagent/InsertTouristProfile.php";
  http.post(url, body:
  {
    "_FirstName": fnamecontrol.text,
    "_LastName": lnamecontrol.text,
    "_Age": agecontrol.text,
    "_TAddress": taddresscontrol.text,
    "_PAddress": paddresscontrol.text,
    "_Contact": contactcontrol.text,
    "_About": aboutcontrol.text,
    "_licno": licnocontrol.text,
    "_language": languagecontrol.text,

  }
  
  );

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
          if(value.isEmpty){
            return 'Please fill your Age.';
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


Widget _buildTaddress () {
return TextFormField(
          controller: taddresscontrol,
          decoration: InputDecoration(
          hintText: 'Temporary Address',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your Temporary Address.';
          }
        },
        onSaved: (String value){
          _taddress = value;
        },
    );
}

Widget _buildPaddress () {
return TextFormField(
          controller: paddresscontrol,
          decoration: InputDecoration(
          hintText: 'Permanent Address',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your Permanent Address.';
          }
        },
        onSaved: (String value){
          _paddress = value;
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

Widget _buildLanguage () {
return TextFormField(
          controller: languagecontrol,
          decoration: InputDecoration(
          hintText: 'What Languages are you fluent?',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill it is mandatory';
          }
        },
        onSaved: (String value){
          _language = value;
        },
    );
}


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.indigo,
        title: Text('Guide Profile',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _logo(),
          SizedBox(height: 10,),
          _buildFirstName(),
          SizedBox(height: 10,),
          _buildlastName(),
          SizedBox(height: 10,),
          _buildAge(),
          SizedBox(height: 10,),
          _buildcontact(),
          SizedBox(height: 10,),
          _buildTaddress(),
          SizedBox(height: 10,),
          _buildPaddress(),
          SizedBox(height: 10,),
          _buildLicNo(),
          SizedBox(height: 10,),
          _buildLanguage(),
          SizedBox(height: 10,),
          _buildAbout(),
          SizedBox(height: 10,),
          //_buildShowImage(),
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
                         // chooseImage();
                         // getImageGallery();
                         //getImage();
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
        ],
      ),
    );
  }
}