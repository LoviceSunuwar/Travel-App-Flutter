import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:travelagent_fyp/Components/SignUpLogoTourist.dart';
import 'package:travelagent_fyp/HomeScreen/HomeScreenAgency.dart';
import 'package:travelagent_fyp/Login/Login.dart';
class HomeScreenSurf extends StatefulWidget {
  @override
  _HomeScreenSurfState createState() => _HomeScreenSurfState();

}

class _HomeScreenSurfState extends State<HomeScreenSurf> {
  @override

Widget build(BuildContext context) {

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
                          new Login())
                        );})
        ],
      
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            InkWell( 
            onTap: () {},
            child: ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.settings, color: Colors.blue),
              ),
            ),InkWell( 
            onTap: () {Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new SignUpLogo())
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
