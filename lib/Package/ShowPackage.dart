import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:travelagent_fyp/HomeScreen/HomeScreen.dart';

class ShowPackage extends StatefulWidget {
  @override
  _ShowPackageState createState() => _ShowPackageState();
}

  Future<List<Package>> downloadJson() async {
    final jsonEndpoint = "http://10.0.2.2/api_yourtravelagent/indexpackage.php";

    final response = await get(jsonEndpoint);
    
    if (response.statusCode == 200) {
      List package = json.decode(response.body);
      return package
        //.map((package)) => new Package.fromJson(package)
        .toList();
    }
    else
    throw Exception('Not Able to download json');

  }


class Package {
  final String package_ID;
  final String packageName, detail, price;

  Package({
    this.package_ID,
    this.packageName,
    this.detail,
    this.price
  });


  factory Package.fromJson(Map<String, dynamic> jsonData) {
    return Package(
      package_ID: jsonData['package_ID'],
      packageName: jsonData['packageName'],
      detail: jsonData['detail'],
      price: jsonData['price'],
    );
  }

}


class _ShowPackageState extends State<ShowPackage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Package Detail')),
      body: new Card(
        elevation: 5.0,
        child: new Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.indigo)),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                child: new Text('Package Details',
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    child: Text (
                      "Name",
                      style: new TextStyle(fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.all(5.0),
                  ),
                  Text(":"),
                  
                ],
              )
            ],
          ),
        
        ),
      ),
    );
  }
}