import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:travelagent_fyp/Login/Login.dart';


class AddDMC extends StatefulWidget {
  final String value;
  AddDMC({Key key, this.value}): super(key: key);
  @override
  _AddDMCState createState() => _AddDMCState();
}

class _AddDMCState extends State<AddDMC> {
  
  String _dmcdetail;
  String _minprice;
  String _maxprice;

  final _formkey = GlobalKey<FormState>();

    TextEditingController minpricecontrol = new TextEditingController();
    TextEditingController dmcdetailcontrol = new TextEditingController();
    TextEditingController maxpricecontrol = new TextEditingController();


  void insertDMCDetail(){
    var url="http://10.0.2.2:81/api_travelagentfyp/FetchDMCDetails.php";
    http.post(url, body: 
    {
      "_DMCDetail": dmcdetailcontrol.text,
      "_MinPrice": minpricecontrol.text,
      "_MaxPrice": maxpricecontrol.text,
      "_Email": widget.value,

    }
    );
  }



Widget _buildDMCDetail () {
return TextFormField(
          controller: dmcdetailcontrol,
          decoration: InputDecoration(
          hintText: '${widget.value}',
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Please fill your requirement.';
          }
        },
        onSaved: (String value){
          _dmcdetail = value;
        },
    );
}

Widget _buildMinPrice () {
return TextFormField(
          controller: minpricecontrol,
          decoration: InputDecoration(
          hintText: 'Minimum Price',
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
            return 'Please fill your Minimum Price in NPR.';
          }
        },
        onSaved: (String value){
          _minprice = value;
        },
    );
}


Widget _buildMaxPrice () {
return TextFormField(
          controller: maxpricecontrol,
          decoration: InputDecoration(
          hintText: 'Maximum Price',
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
            return 'Please fill your Maximum Price in NPR.';
          }
        },
        onSaved: (String value){
          _maxprice = value;
        },
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
        title: Text('Add DMC',
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
          _buildDMCDetail(),
          SizedBox(height: 20.0),
          _buildMinPrice(),
          SizedBox(height: 20.0),
          _buildMaxPrice(),
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
                          insertDMCDetail();
                          print("Button working");
                        },
                                child:
                         Center(
                         child: Text('Add DMC',
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