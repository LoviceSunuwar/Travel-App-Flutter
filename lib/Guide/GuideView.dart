import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Guide extends StatefulWidget {
  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {

Future<List> getData() async {
  final response=await http.get("http://10.0.2.2/api_travelagent/guide.php");
  print(response.body);
  return json.decode(response.body);
}


  @override
  Widget build(BuildContext context) {
      return Scaffold(
     appBar: new AppBar(
        elevation: 0.2,
        backgroundColor: Colors.indigoAccent,
        title: Text('Guides',
         style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          ),
          ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: Icon(
              Icons.person_pin,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (ctx,ss){ 
          if(ss.hasError)
          {
            print("Sorry! there is an error.");
          }         
          if(ss.hasData)
          {
            return Guidelist(list:ss.data);
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class Guidelist extends StatelessWidget {

  List list;
  Guidelist({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null?0:list.length,
      itemBuilder: (BuildContext context, i){
        return ListTile(
          leading: Icon(Icons.local_drink),
          title: Text(list[i]['guide_name']),
          onTap: (){},
        );
      },
    );
  }
}