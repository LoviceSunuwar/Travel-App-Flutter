

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Package.dart';

 Future<List<Package>> _getData() async {
    var url =
        'http://10.0.2.2:81/api_travelagentfyp/packageindex.php';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    List<Package> package = _mapJsonToPackage(response.body);
    return package;
  }

  List<Package> _mapJsonToPackage(String response) {
    return (jsonDecode(response) as List).map((packageAsString) {
      return Package.fromJson(packageAsString);
    }).toList();
  }



class ShowPackage extends StatefulWidget {
   final List<Package> package;
 

  ShowPackage({Key key, this.package});

  @override


  _ShowPackageState createState() => _ShowPackageState();
}

class _ShowPackageState extends State<ShowPackage> {
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (BuildContext context, AsyncSnapshot<List<Package>> snapshot) {
  if (snapshot.hasData) {
            Package package = snapshot.data[0];
           ListTile(
                 title: new Card(
          elevation: 5.0,
          child: new Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(package.packageImage),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
                Row(children: <Widget>[
                  Padding(
                      child: Text(
                        package.packageName,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                  Text(" | "),
                  Padding(
                      child: Text(
                        package.packageImage,
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                ]),
              ],
            ),
          ),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          // var route = new MaterialPageRoute(
          //   builder: (BuildContext context) =>
          //   new SecondScreen(value: spacecraft),
          // );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          //Navigator.of(context).push(route);
        }
              );
            
          }
    }
    );
  }
}