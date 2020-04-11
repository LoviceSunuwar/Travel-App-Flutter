import 'dart:io';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:travelagent_fyp/Login/Login.dart';
import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';
import 'dart:math' as Math;

class ProfileSignUpAgency extends StatefulWidget {
  @override
  _ProfileSignUpAgencyState createState() => _ProfileSignUpAgencyState();
}

class _ProfileSignUpAgencyState extends State<ProfileSignUpAgency> {
 
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


void insertTouristProfile(){
 
    var url="http://10.0.2.2:81/api_yourtravelagent/InsertTouristProfile.php";
  http.post(url, body:
  {
    "_agencyname": agencyNamecontrol.text,
    "_address": addresscontrol.text,
    "_panNo": panNocontrol.text,
    "_Contact": contactcontrol.text,
    "_About": aboutcontrol.text,

  }
  
  );

}

// File _image;
// TextEditingController cTitle = new TextEditingController();

// Future getImageGallery() async{
//   var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

//   final tempDir =await getTemporaryDirectory();
//   final path = tempDir.path;

//   int rand= new Math.Random().nextInt(100000);

//   Img.Image image= Img.decodeImage(imageFile.readAsBytesSync());
//   //Img.Image smallerImg = Img.copyResize(image, 500);

//   var compressImg= new File("$path/image_$rand.jpg");
//   //..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));


//   setState(() {
//       _image = compressImg;
//     });
// }

	
// $Image = '';
// $ImageName = '';

// if (isset($_POST['_image'])) {
// 	$Image = $_POST['_image'];
// }
	
// if (isset($_POST['_imageName'])) {
// 	$ImageName = $_POST['_imageName'];
// }


//   $realImage = base64_decode($Image);
  
//   file_put_contents($Image,$ImageName);
// //   echo "OK";
// Future upload(File imageFile) async{
//   var stream= new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//   var length= await imageFile.length();
//   var uri = Uri.parse("http://10.0.2.2/api_yourtravelagent/InsertTouristPhoto.php");

//   var request = new http.MultipartRequest("POST", uri);

//   var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path)); 
//   request.fields['title'] = cTitle.text;
//   request.files.add(multipartFile); 

//   var response = await request.send();

//   if(response.statusCode==200){
//     print("Image Uploaded");
//   }else{
//     print("Upload Failed");
//   }
//   response.stream.transform(utf8.decoder).listen((value) {
//       print(value);
//     });
// }



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
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
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


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.indigo,
        title: Text('Tourist Profile',
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
                         //getImageGallery();
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
                          //upload(_image);
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