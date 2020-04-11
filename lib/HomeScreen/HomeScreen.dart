import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelagent_fyp/Guide/GuideView.dart';
import 'package:travelagent_fyp/HomeScreen/HomeScreenAgency.dart';
import 'package:travelagent_fyp/Package/AddDMC.dart';
import 'package:travelagent_fyp/Profile/PofileTourist.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;





class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override


Widget image_carousel = new Container(
  height: 150.0,
  child: new Carousel(
    boxFit: BoxFit.cover, // The images we are going to have inside this needs to fill of the carousel
    images: [             // using [] bracket for listing
      AssetImage('assets/images/ca01.jpg'),
      AssetImage('assets/images/ca02.jpg'),
      AssetImage('assets/images/ca03.jpg'),
      AssetImage('assets/images/ca04.jpg'),
    ],
    autoplay: true,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 1000),
    dotSize: 4.0,
    indicatorBgPadding: 2.0,
  ),

); 


Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.5,
        backgroundColor: Colors.yellow,
        title: Text('Travel Agent',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.grey,), 
          onPressed: () {}),
          new IconButton(icon: Icon(Icons.person_pin, color: Colors.grey,), 
          onPressed: () {Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new ProfileViewTourist())
                        );})
        ],
      
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // Header of the drawaer
            new UserAccountsDrawerHeader(accountName: new Text('Name') ,
            accountEmail: new Text('Email address'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person),
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.indigo,
            ),
            ),
            // Body of the drawer

            new InkWell( //Using this inkwell because it makes any part of the page into a button
            
            onTap: () {Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new AddDMC())
                        );},
            child: ListTile(
              title: Text('Create DMC'),
              leading: Icon(Icons.location_searching),
              ),
            ),
             InkWell( 
            onTap: () {Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new Guide())
                        );},
            child: ListTile(
              title: Text('Add Points'),
              leading: Icon(Icons.add),
              ),
            ),
            InkWell( 
            onTap: () {},
            child: ListTile(
              title: Text('My orders'),
              leading: Icon(Icons.link),
              ),
            ),

            Divider(), // To Create a space between the two objects
            InkWell( 
            onTap: () {Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new AgencyHomeScreen())
                        );},
            child: ListTile(
              title: Text('About Us'),
              leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          // Image carousel beigns here
          image_carousel,
          // Adding padding widget
         
        ],
      ),    
    );
  }


}
