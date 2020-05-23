import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:travelagent_fyp/Login/Login.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as Img;

class AddPackage extends StatefulWidget {
  String value;
  AddPackage({Key key, this.value});
  @override
  _AddPackageState createState() => _AddPackageState();
}

class _AddPackageState extends State<AddPackage> {
  

  // void initState() {
  //   getEmailPref().then((updateEmail));
  //   super.initState();
  // }

  
  String _packagename;
  String _detail;
  String _price;
  
  final _formkey = GlobalKey<FormState>();
    TextEditingController pNamecontrol = new TextEditingController();
    TextEditingController detailcontrol = new TextEditingController();
    TextEditingController pricecontrol = new TextEditingController();



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
  var uri = Uri.parse("http://10.0.2.2:81/api_travelagentfyp/FetchPackageDetails.php");

  var request = new http.MultipartRequest("POST", uri);

  var multipartFile = new http.MultipartFile("_image", stream, length, filename: basename(imageFile.path)); 
  
  request.fields['_Email'] = widget.value;
  request.fields['_packagename']= pNamecontrol.text;
  request.fields['_detail']= detailcontrol.text;
  request.fields['_price']= pricecontrol.text;
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



Widget _buildPackageName () {
return TextFormField(
          controller: pNamecontrol,
          decoration: InputDecoration(
          hintText: 'Package Name',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill Package Name.';
          }
        },
        onSaved: (String value){
          _packagename = value;
        },
    );
}


Widget _buildPackageDetail () {
return TextFormField(
          controller: detailcontrol,
          decoration: InputDecoration(
          hintText: 'Package Detail',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill Package Detail.';
          }
        },
        onSaved: (String value){
          _detail = value;
        },
    );
}


Widget _buildPrice () {
return TextFormField(
          controller: pricecontrol,
          decoration: InputDecoration(
          hintText: 'Price',
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
            return 'Please fill your Price in NPR.';
          }
        },
        onSaved: (String value){
          _price = value;
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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.indigo,
        title: Text('Add Package',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
          children: <Widget>[
            _logo(),
            SizedBox(height: 20.0),
            _buildPackageName(),
            SizedBox(height: 20.0),
            _buildPackageDetail(),
            SizedBox(height: 20.0),
            _buildPrice(),
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
                  onTap: () {getImageGallery();
                    print('button is working');
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
            SizedBox(height: 20),
            _showImage(),
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
                    upload(_image);
                    //insertPackageDetail();
                    print('button is working');
                  },
                          child:
                   Center(
                   child: Text('Add Package',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                        ),
                    ),
                 ),
            ),
            SizedBox(height: 20),
           
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
        )
    );
  }
}