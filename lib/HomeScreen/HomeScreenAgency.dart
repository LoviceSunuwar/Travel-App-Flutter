import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:travelagent_fyp/Package/AddPackage.dart';
import 'package:travelagent_fyp/Profile/ProfileAgency.dart';


class AgencyHomeScreen extends StatefulWidget {
  
  final String value;
  AgencyHomeScreen({Key key, this.value }) : super(key: key);
  @override
  _AgencyHomeScreenState createState() => _AgencyHomeScreenState();
}

class _AgencyHomeScreenState extends State<AgencyHomeScreen> {
 

Widget build(BuildContext context) {

var useremail = widget.value;

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
        backgroundColor: Colors.redAccent,
        title: Text('Agency',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.grey,), onPressed: () {}),
          new IconButton(icon: Icon(Icons.person_pin, color: Colors.grey,), 
          
          onPressed: () {ProfileViewAgency();})
          
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

            InkWell( //Using this inkwell because it makes any part of the page into a button
            onTap: () {  Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                          new AddPackage(value: useremail))
                       );},
            child: ListTile(
              title: Text('Create Package'),
              leading: Icon(Icons.location_searching),
              ),
            ),
             InkWell( 
            onTap: () {},
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
            onTap: () {},
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
          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text("${widget.value}"),
          
          )
        ],
      ),
    );
}
  }